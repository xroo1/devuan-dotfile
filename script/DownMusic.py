#!/usr/bin/env python3
import os
import sys
import subprocess
import json
import requests
from pathlib import Path
from urllib.parse import urlparse, parse_qs
import argparse
import mutagen
from mutagen.id3 import ID3, APIC
from mutagen.mp3 import MP3
from mutagen.flac import FLAC, Picture
from PIL import Image
import io
import tempfile
import shutil
import time

try:
    from rich.console import Console
    from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn, TaskProgressColumn
    from rich.prompt import Prompt, Confirm
    from rich.panel import Panel
    from rich.table import Table
    from rich import print as rprint
    from rich.markdown import Markdown
except ImportError:
    print("Instalando dependências necessárias...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "rich", "yt-dlp", "mutagen", "Pillow", "requests", "--break-system-packages"])
    from rich.console import Console
    from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn, TaskProgressColumn
    from rich.prompt import Prompt, Confirm
    from rich.panel import Panel
    from rich.table import Table
    from rich import print as rprint
    from rich.markdown import Markdown

console = Console()

class YouTubeDownloader:
    def __init__(self):
        self.download_path = Path.home() / "Music" / "YouTube"
        self.download_path.mkdir(parents=True, exist_ok=True)
        self.temp_dir = self.download_path / "temp"
        self.temp_dir.mkdir(exist_ok=True)
    
    def get_playlist_videos(self, playlist_url):
        """Obtém lista de vídeos da playlist"""
        try:
            console.print("[yellow]🔍 Obtendo lista de vídeos...[/yellow]")
            cmd = [
                'yt-dlp',
                '--flat-playlist',
                '--print', '%(title)s|||%(id)s|||%(webpage_url)s',
                '--no-warnings',
                playlist_url
            ]
            result = subprocess.run(cmd, capture_output=True, text=True, check=True)
            
            videos = []
            for line in result.stdout.strip().split('\n'):
                if line and '|||' in line:
                    parts = line.split('|||')
                    if len(parts) >= 3:
                        videos.append({
                            'title': parts[0],
                            'id': parts[1],
                            'url': parts[2]
                        })
            return videos
        except Exception as e:
            console.print(f"[red]❌ Erro ao obter playlist: {e}[/red]")
            return []
    
    def download_video_as_mp4(self, video_url, video_title):
        """Baixa o vídeo como MP4 (mais confiável)"""
        try:
            console.print(f"[yellow]📥 Baixando: {video_title}[/yellow]")
            
            # Nome seguro para arquivo
            safe_title = "".join(c for c in video_title if c.isalnum() or c in (' ', '-', '_')).rstrip()
            output_file = self.temp_dir / f"{safe_title}.mp4"
            
            # Comando SIMPLES para baixar o vídeo
            cmd = [
                'yt-dlp',
                '-f', 'best[height<=720]',  # Qualidade balanceada
                '--no-warnings',
                '-o', str(output_file),
                video_url
            ]
            
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=300)
            
            if result.returncode == 0 and output_file.exists():
                file_size = output_file.stat().st_size / (1024 * 1024)
                console.print(f"[green]✅ Vídeo baixado: {file_size:.1f}MB[/green]")
                return output_file
            else:
                console.print(f"[red]❌ Falha no download[/red]")
                if result.stderr:
                    console.print(f"[red]Erro: {result.stderr}[/red]")
                return None
                
        except subprocess.TimeoutExpired:
            console.print(f"[red]❌ Timeout no download[/red]")
            return None
        except Exception as e:
            console.print(f"[red]❌ Erro: {e}[/red]")
            return None
    
    def convert_to_mp3(self, video_file, video_title, video_id):
        """Converte MP4 para MP3 e adiciona capa"""
        try:
            console.print(f"[cyan]🔄 Convertendo para MP3...[/cyan]")
            
            # Arquivo de saída MP3
            safe_title = "".join(c for c in video_title if c.isalnum() or c in (' ', '-', '_')).rstrip()
            mp3_file = self.download_path / f"{safe_title}.mp3"
            
            # Converter usando ffmpeg
            cmd = [
                'ffmpeg',
                '-i', str(video_file),
                '-codec:a', 'libmp3lame',
                '-qscale:a', '2',  # Qualidade boa
                '-y',  # Sobrescrever
                str(mp3_file)
            ]
            
            result = subprocess.run(cmd, capture_output=True, text=True)
            
            if result.returncode == 0 and mp3_file.exists():
                # Adicionar capa
                self.add_cover_to_mp3(mp3_file, video_id, video_title)
                
                file_size = mp3_file.stat().st_size / (1024 * 1024)
                console.print(f"[green]✅ MP3 criado: {file_size:.1f}MB[/green]")
                return True
            else:
                console.print(f"[red]❌ Falha na conversão[/red]")
                return False
                
        except Exception as e:
            console.print(f"[red]❌ Erro na conversão: {e}[/red]")
            return False
    
    def get_youtube_thumbnail(self, video_id):
        """Obtém thumbnail do YouTube"""
        try:
            qualities = ["maxresdefault", "sddefault", "hqdefault", "0"]
            
            for quality in qualities:
                url = f"https://img.youtube.com/vi/{video_id}/{quality}.jpg"
                response = requests.get(url, timeout=10)
                if response.status_code == 200 and len(response.content) > 5000:
                    return response.content
            return None
        except:
            return None
    
    def add_cover_to_mp3(self, mp3_file, video_id, video_title):
        """Adiciona capa ao MP3"""
        try:
            console.print(f"[magenta]🎨 Adicionando capa...[/magenta]")
            
            # Buscar thumbnail
            cover_data = self.get_youtube_thumbnail(video_id)
            
            if not cover_data:
                console.print(f"[yellow]⚠️ Capa não encontrada para {video_title}[/yellow]")
                return False
            
            # Adicionar capa ao MP3
            audio = MP3(mp3_file, ID3=ID3)
            
            try:
                audio.add_tags()
            except:
                pass
            
            # Remover capas existentes
            if audio.tags:
                for key in list(audio.tags.keys()):
                    if key.startswith('APIC'):
                        del audio.tags[key]
            
            # Adicionar nova capa
            audio.tags.add(APIC(
                encoding=3,
                mime='image/jpeg',
                type=3,
                desc='Cover',
                data=cover_data
            ))
            
            audio.save(v2_version=3)
            console.print(f"[green]✅ Capa adicionada![/green]")
            return True
            
        except Exception as e:
            console.print(f"[red]❌ Erro ao adicionar capa: {e}[/red]")
            return False
    
    def download_playlist_robust(self, playlist_url):
        """Método ROBUSTO para baixar playlist"""
        try:
            # Obter vídeos da playlist
            videos = self.get_playlist_videos(playlist_url)
            
            if not videos:
                console.print("[red]❌ Nenhum vídeo encontrado na playlist[/red]")
                return False
            
            console.print(f"[cyan]📊 Playlist com {len(videos)} vídeos encontrada[/cyan]")
            
            # Mostrar preview
            table = Table(title="🎵 Vídeos na Playlist")
            table.add_column("#", style="cyan")
            table.add_column("Título", style="white")
            
            for i, video in enumerate(videos[:8], 1):
                title = video['title'][:50] + "..." if len(video['title']) > 50 else video['title']
                table.add_row(str(i), title)
            
            if len(videos) > 8:
                table.add_row("...", f"... e mais {len(videos) - 8} vídeos")
            
            console.print(table)
            
            if not Confirm.ask(f"🎯 Baixar {len(videos)} vídeos?"):
                return False
            
            success_count = 0
            failed_count = 0
            
            # Processar cada vídeo
            for i, video in enumerate(videos, 1):
                console.print(f"\n[bold cyan]🎵 [{i}/{len(videos)}] {video['title']}[/bold cyan]")
                
                # 1. Baixar como MP4
                video_file = self.download_video_as_mp4(video['url'], video['title'])
                
                if video_file:
                    # 2. Converter para MP3 e adicionar capa
                    if self.convert_to_mp3(video_file, video['title'], video['id']):
                        success_count += 1
                        console.print(f"[green]✅ [{i}/{len(videos)}] Concluído![/green]")
                        
                        # Limpar arquivo MP4 temporário
                        try:
                            video_file.unlink()
                        except:
                            pass
                    else:
                        failed_count += 1
                        console.print(f"[red]❌ [{i}/{len(videos)}] Falha na conversão[/red]")
                else:
                    failed_count += 1
                    console.print(f"[red]❌ [{i}/{len(videos)}] Falha no download[/red]")
                
                # Pausa entre downloads
                if i < len(videos):
                    console.print("[yellow]⏳ Aguardando 3 segundos...[/yellow]")
                    time.sleep(3)
            
            # Limpar pasta temporária
            self.clean_temp_files()
            
            # Resultado final
            console.print(f"\n[bold green]📊 RESULTADO FINAL:[/bold green]")
            console.print(f"[green]✅ Sucessos: {success_count}[/green]")
            console.print(f"[red]❌ Falhas: {failed_count}[/red]")
            
            if success_count > 0:
                console.print(f"[cyan]📁 Arquivos MP3 em: {self.download_path}[/cyan]")
                return True
            else:
                console.print("[red]❌ Nenhum vídeo foi baixado com sucesso[/red]")
                return False
            
        except Exception as e:
            console.print(f"[red]❌ Erro fatal: {e}[/red]")
            return False
    
    def download_single_video(self, video_url):
        """Baixa um único vídeo"""
        try:
            console.print("[yellow]🔍 Obtendo informações do vídeo...[/yellow]")
            
            # Obter título do vídeo
            cmd = [
                'yt-dlp',
                '--print', '%(title)s|||%(id)s',
                '--no-warnings',
                video_url
            ]
            
            result = subprocess.run(cmd, capture_output=True, text=True)
            if result.returncode != 0:
                console.print("[red]❌ Não foi possível obter informações do vídeo[/red]")
                return False
            
            parts = result.stdout.strip().split('|||')
            if len(parts) < 2:
                console.print("[red]❌ Informações do vídeo incompletas[/red]")
                return False
            
            video_title = parts[0]
            video_id = parts[1]
            
            console.print(f"[cyan]🎵 Vídeo: {video_title}[/cyan]")
            
            # Baixar como MP4
            video_file = self.download_video_as_mp4(video_url, video_title)
            
            if video_file:
                # Converter para MP3
                if self.convert_to_mp3(video_file, video_title, video_id):
                    console.print("[green]✅ Download e conversão concluídos![/green]")
                    # Limpar MP4
                    try:
                        video_file.unlink()
                    except:
                        pass
                    return True
                else:
                    console.print("[red]❌ Falha na conversão[/red]")
                    return False
            else:
                console.print("[red]❌ Falha no download[/red]")
                return False
                
        except Exception as e:
            console.print(f"[red]❌ Erro: {e}[/red]")
            return False
    
    def clean_temp_files(self):
        """Limpa arquivos temporários"""
        try:
            for file_path in self.temp_dir.glob("*"):
                try:
                    file_path.unlink()
                except:
                    pass
        except:
            pass
    
    def show_downloaded_files(self):
        """Mostra arquivos MP3 baixados"""
        mp3_files = list(self.download_path.glob("*.mp3"))
        
        if not mp3_files:
            console.print("[red]❌ Nenhum arquivo MP3 encontrado[/red]")
            return
        
        console.print(f"[green]🎵 Arquivos MP3 ({len(mp3_files)}):[/green]")
        for mp3 in mp3_files:
            size_mb = mp3.stat().st_size / (1024 * 1024)
            console.print(f"  📁 {mp3.name} ({size_mb:.1f} MB)")
    
    def main_menu(self):
        """Menu principal"""
        console.print(Panel.fit(
            "🎵 YouTube to MP3 Converter 🎵\nMétodo Robusto - Sem Erros 403",
            style="bold blue"
        ))
        
        while True:
            console.print("\n" + "="*50)
            console.print("1. 📥 Baixar vídeo individual")
            console.print("2. 📋 Baixar playlist completa") 
            console.print("3. 📁 Ver arquivos baixados")
            console.print("4. 🧹 Limpar temporários")
            console.print("5. ❌ Sair")
            
            choice = Prompt.ask(
                "\n🎯 Escolha uma opção",
                choices=["1", "2", "3", "4", "5"],
                default="1"
            )
            
            if choice == "1":
                self.download_single_menu()
            elif choice == "2":
                self.download_playlist_menu()
            elif choice == "3":
                self.show_downloaded_files()
            elif choice == "4":
                self.clean_temp_files()
                console.print("[green]✅ Temporários limpos![/green]")
            elif choice == "5":
                console.print("[green]🎶 Até logo! 👋[/green]")
                break
    
    def download_single_menu(self):
        """Menu para download individual"""
        url = Prompt.ask("🔗 URL do YouTube")
        
        if not self.validate_youtube_url(url):
            console.print("[red]❌ URL inválida![/red]")
            return
        
        with Progress(
            SpinnerColumn(),
            TextColumn("[progress.description]{task.description}"),
            transient=True,
        ) as progress:
            progress.add_task(description="Processando...", total=None)
            success = self.download_single_video(url)
        
        if success:
            console.print("[green]✅ Conversão para MP3 concluída![/green]")
        else:
            console.print("[red]❌ Falha no processo[/red]")
    
    def download_playlist_menu(self):
        """Menu para download de playlist"""
        url = Prompt.ask("🔗 URL da playlist")
        
        if not self.validate_youtube_url(url):
            console.print("[red]❌ URL inválida![/red]")
            return
        
        success = self.download_playlist_robust(url)
        
        if success:
            console.print("[green]✅ Playlist processada com sucesso![/green]")
        else:
            console.print("[red]❌ Falha no processamento da playlist[/red]")
    
    def validate_youtube_url(self, url):
        """Valida URL do YouTube"""
        parsed = urlparse(url)
        valid_domains = ['youtube.com', 'www.youtube.com', 'youtu.be', 'm.youtube.com']
        return any(domain in parsed.netloc for domain in valid_domains)

def main():
    """Função principal"""
    try:
        # Verificar dependências
        try:
            subprocess.run(['yt-dlp', '--version'], capture_output=True, check=True)
        except:
            console.print("[yellow]📦 Instalando yt-dlp...[/yellow]")
            subprocess.check_call([sys.executable, '-m', 'pip', 'install', 'yt-dlp'])
        
        # Verificar ffmpeg
        try:
            subprocess.run(['ffmpeg', '-version'], capture_output=True, check=True)
        except:
            console.print("[red]❌ ffmpeg não encontrado! Instale com:[/red]")
            console.print("[yellow]  Ubuntu: sudo apt install ffmpeg[/yellow]")
            console.print("[yellow]  macOS: brew install ffmpeg[/yellow]")
            return
        
        downloader = YouTubeDownloader()
        downloader.main_menu()
        
    except KeyboardInterrupt:
        console.print("\n[yellow]👋 Interrompido pelo usuário[/yellow]")
    except Exception as e:
        console.print(f"[red]❌ Erro: {e}[/red]")

if __name__ == "__main__":
    main()

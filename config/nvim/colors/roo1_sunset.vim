" Tema 'Luz do Sol' - Estilo Claro (Inspirado no Gruvbox Light)
highlight clear
syntax reset
set background=light

let g:colors_name = "sunlight_gruvish"

" -----------------------------------------------------------
" Paleta Principal (Ajustada para contraste Gruvbox-like)
" -----------------------------------------------------------
let s:bg_cream     = '#f8f4e8'  " Fundo branco amarelado (mais quente que Gruvbox)
let s:bg_light     = '#f0e6d2'  " Realces (tons de papel envelhecido)
let s:fg_dark      = '#5a4a3a'  " Texto principal (marrom escuro suave)
let s:fg_medium    = '#7a6a5a'  " Texto secundário
let s:accent_blue  = '#3a6ea5'  " Azul suave
let s:accent_amber = '#d18f2a'  " Dourado/âmbar (mais vibrante que Gruvbox)
let s:accent_olive = '#6a7a3a'  " Verde oliva
let s:accent_rose  = '#c06a6a'  " Rosa terroso

" -----------------------------------------------------------
" Configurações Base (Estilo Gruvbox Claro)
" -----------------------------------------------------------
highlight Normal       guibg=#f8f4e8 guifg=#5a4a3a
highlight ColorColumn  guibg=#f0e6d2
highlight CursorLine   guibg=#f0e6d2 gui=NONE  " Sem sublinhado, como Gruvbox
highlight CursorLineNr guibg=#f0e6d2 guifg=#d18f2a gui=bold
highlight LineNr       guibg=#f0e6d2 guifg=#8a7a6a  " Contraste aumentado
highlight Cursor       guibg=#5a4a3a guifg=#f8f4e8

" -----------------------------------------------------------
" Sintaxe (Cores Terrosas com Contraste Gruvbox)
" -----------------------------------------------------------
highlight Comment      guifg=#928374 gui=italic  " Cinza esverdeado (como Gruvbox)
highlight Constant     guifg=#6a7a3a             " Verde oliva
highlight Identifier   guifg=#5a4a3a gui=NONE    " Sem bold (estilo Gruvbox)
highlight Statement    guifg=#d18f2a gui=bold    " Âmbar como destaque
highlight PreProc      guifg=#3a6ea5             " Azul
highlight Type         guifg=#5a6a8a gui=NONE    " Azul acinzentado
highlight Special      guifg=#c06a6a             " Rosa terroso
highlight Underlined   guifg=#3a6ea5 gui=underline
highlight Todo         guibg=#f0e6d2 guifg=#c06a6a gui=bold  " Estilo Gruvbox

" -----------------------------------------------------------
" Interface (Ajustes Gruvbox-like)
" -----------------------------------------------------------
" StatusLine (inspirado no Gruvbox, mas mais suave)
highlight StatusLine   guibg=#e0d8c8 guifg=#5a4a3a gui=NONE
highlight StatusLineNC guibg=#e8e0d0 guifg=#7a6a5a gui=NONE

" Pmenu (mais contrastante)
highlight Pmenu        guibg=#e8e0d0 guifg=#5a4a3a
highlight PmenuSel     guibg=#d18f2a guifg=#f8f4e8 gui=bold
highlight PmenuSbar    guibg=#d8d0c0
highlight PmenuThumb   guibg=#a09888

" Divisores de Janela (como Gruvbox, mas mais espessos)
highlight VertSplit    guifg=#a09888 guibg=#f0e6d2 gui=NONE
highlight WinSeparator guifg=#a09888 guibg=#f0e6d2 gui=bold  " Linhas mais visíveis

" -----------------------------------------------------------
" Destaques (Contraste Gruvbox-like)
" -----------------------------------------------------------
highlight Search       guibg=#e8d8a8 guifg=#5a4a3a gui=NONE
highlight IncSearch    guibg=#d18f2a guifg=#f8f4e8 gui=bold
highlight Visual       guibg=#d8c8a8 guifg=#5a4a3a  " Mais escuro que o original
highlight MatchParen   guibg=#e8e0d0 guifg=#c06a6a gui=bold

" -----------------------------------------------------------
" Abas (Estilo Gruvbox simplificado)
" -----------------------------------------------------------
highlight TabLine      guibg=#e8e0d0 guifg=#7a6a5a gui=NONE
highlight TabLineSel   guibg=#f8f4e8 guifg=#d18f2a gui=bold
highlight TabLineFill  guibg=#e8e0d0 gui=NONE

" -----------------------------------------------------------
" Outros (Consistência com Gruvbox Light)
" -----------------------------------------------------------
highlight Folded       guibg=#f0e6d2 guifg=#7a6a5a
highlight FoldColumn   guibg=#f0e6d2 guifg=#8a7a6a
highlight EndOfBuffer  guifg=#f0e6d2  " Combina com o fundo

" Mensagens (Cores mais próximas do Gruvbox)
highlight ErrorMsg     guibg=#c06a6a guifg=#f8f4e8 gui=bold
highlight WarningMsg   guifg=#d18f2a gui=bold
highlight ModeMsg      guifg=#6a7a3a gui=bold
highlight MoreMsg      guifg=#3a6ea5 gui=bold

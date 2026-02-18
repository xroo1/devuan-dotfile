" Exemplo de esquema de cores para o Vim baseado no xterm

highlight clear
syntax reset

" Cores básicas
highlight Normal       guibg=NONE guifg=#c0c0c0
highlight ColorColumn  guibg=NONE guifg=#c0c0c0
highlight CursorLine   guibg=NONE guifg=#c0c0c0
highlight LineNr       guibg=NONE guifg=#36393f
highlight CursorLineNr guibg=NONE guifg=#c0c0c0
highlight Cursor       guibg=NONE guifg=#c0c0c0

" Cores para comentários, constantes, identificadores, etc.
highlight Comment      guifg=#2d3035 guibg=NONE
highlight Constant     guifg=#3ea28d guibg=NONE
highlight Identifier   guifg=#a8a8a8 guibg=NONE
highlight Statement    guifg=#EC1850 guibg=NONE
highlight PreProc      guifg=#4dc5ce guibg=NONE
highlight Type         guifg=#558188 guibg=NONE
highlight Special      guifg=#EC1850 guibg=NONE
highlight Underlined   gui=underline guifg=#4e4d80 guibg=NONE
highlight Todo         guifg=#050505 guibg=#EC1850

" Cores para buscas
highlight Search       guibg=#4dc5ce guifg=#080808
highlight IncSearch    guibg=#558188 guifg=#080808

" Cores para diff
highlight DiffAdd      guibg=#080808 guifg=#3ea28d
highlight DiffChange   guibg=#080808 guifg=#4dc5ce
highlight DiffDelete   guibg=#080808 guifg=#EC1850
highlight DiffText     guibg=#080808 guifg=#6ea2a5

" Cores para menu
highlight Pmenu        guibg=NONE guifg=#c0c0c0
highlight PmenuSel     guibg=#36393f guifg=#c0c0c0
highlight PmenuSbar    guibg=#36393f guifg=#c0c0c0
highlight PmenuThumb   guibg=#c0c0c0 guifg=#36393f

" Cores para status line
highlight StatusLine   guibg=NONE guifg=#c0c0c0
highlight StatusLineNC guibg=NONE guifg=#36393f

" Cores para visual mode
highlight Visual       guibg=#36393f guifg=#080808

" Linha divisória entre splits
highlight VertSplit guifg=#2e2e2e guibg=NONE " Ajuste para cinza escuro quase preto

" Ajuste de fundo e cores de áreas internas e divisórias
highlight Normal guibg=NONE guifg=#c0c0c0
highlight ColorColumn guibg=NONE guifg=#c0c0c0
highlight CursorLine guibg=NONE guifg=#c0c0c0
highlight StatusLine guibg=NONE guifg=#c0c0c0
highlight StatusLineNC guibg=NONE  guifg=#36393f

" Ajustes para as áreas de não texto (bordas e colunas de sinais)
highlight WinSeparator guibg=NONE guifg=#3a3a3a " Cor de fundo das bordas das janelas (clareado)
highlight NonText guibg=NONE guifg=#3a3a3a      " Fundo de áreas sem texto (incluindo bordas, clareado)
highlight SignColumn guibg=NONE guifg=#c0c0c0      " Coluna de sinais (agora com fundo cinza escuro)

" Números de linha
highlight LineNr       guibg=NONE guifg=#36393f   " Números de linha com fundo escuro
highlight CursorLineNr guibg=NONE guifg=#c0c0c0   " Número da linha atual


" Esquema de cores Gray Modern Vibrant - Cores de sintaxe intensificadas

" Limpar configurações anteriores
highlight clear
syntax reset
set background=dark

let g:colors_name = "gray_modern_vibrant"

" -----------------------------------------------------------
" Cores Principais (hierarquia de tons)
" -----------------------------------------------------------
highlight Normal       guibg=#3c3c3c guifg=#e0e0e0
highlight ColorColumn  guibg=#4a4a4a
highlight CursorLine   guibg=#444444 guifg=NONE
highlight CursorLineNr guibg=#505050 guifg=#ffffff
highlight Cursor       guibg=#e0e0e0 guifg=#3c3c3c
highlight LineNr       guibg=#454545 guifg=#9a9a9a

" -----------------------------------------------------------
" Sintaxe (cores VIVAS com máximo contraste)
" -----------------------------------------------------------
" Comentários ainda discretos mas legíveis
highlight Comment      guifg=#7a7a7a gui=italic guibg=NONE

" Cores principais intensificadas
highlight Constant     guifg=#2dccb9 guibg=NONE    " Verde-água mais saturado
highlight Identifier   guifg=#d4d4d4 guibg=NONE    " Identificadores mais brilhantes
highlight Statement    guifg=#ff2d62 guibg=NONE    " Vermelho mais intenso
highlight PreProc      guifg=#00ccff guibg=NONE    " Azul claro neon
highlight Type         guifg=#00a3a3 guibg=NONE    " Azul-turquesa forte
highlight Special      guifg=#ff5f5f guibg=NONE    " Vermelho-alaranjado
highlight Underlined   gui=underline guifg=#a5a5ff " Roxo mais claro
highlight Todo         guifg=#ffffff guibg=#ff2d62 " TODOs com vermelho vivo

" Adicionais para linguagens específicas
highlight String       guifg=#b5ff80 guibg=NONE    " Verde-limão para strings
highlight Number       guifg=#ffaa80 guibg=NONE    " Laranja para números
highlight Function     guifg=#ffcc66 guibg=NONE    " Amarelo para funções
highlight Keyword      guifg=#ff66b2 guibg=NONE    " Rosa para keywords

" -----------------------------------------------------------
" Componentes de Interface (inalterados)
" -----------------------------------------------------------
" Barra de status
highlight StatusLine   guibg=#505050 guifg=#e0e0e0
highlight StatusLineNC guibg=#505050 guifg=#7a7a7a

" Menu suspenso
highlight Pmenu        guibg=#4a4a4a guifg=#e0e0e0
highlight PmenuSel     guibg=#505050 guifg=#ffffff
highlight PmenuSbar    guibg=#444444
highlight PmenuThumb   guibg=#606060

" Divisórias
highlight VertSplit    guifg=#606060 guibg=#3c3c3c
highlight WinSeparator guifg=#606060 guibg=NONE
highlight NonText      guifg=#5a5a5a guibg=NONE
highlight SignColumn   guibg=#454545 guifg=#e0e0e0

" -----------------------------------------------------------
" Destaques e Interação (cores intensificadas)
" -----------------------------------------------------------
" Busca e seleção
highlight Search       guibg=#00ccff guifg=#000000  " Azul neon com texto preto
highlight IncSearch    guibg=#ffaa00 guifg=#000000  " Laranja vibrante
highlight Visual       guibg=#606060 guifg=#ffffff  " Seleção com branco puro
highlight MatchParen   guibg=#505050 guifg=#ff2d62 " Vermelho vivo

" Diff
highlight DiffAdd      guibg=#4a4a4a guifg=#2dccb9
highlight DiffChange   guibg=#4a4a4a guifg=#00ccff
highlight DiffDelete   guibg=#4a4a4a guifg=#ff2d62
highlight DiffText     guibg=#505050 guifg=#00e6e6

" -----------------------------------------------------------
" Outros Elementos
" -----------------------------------------------------------
highlight Folded       guibg=#444444 guifg=#7a7a7a
highlight FoldColumn   guibg=#454545 guifg=#7a7a7a
highlight EndOfBuffer  guifg=#3c3c3c guibg=NONE

" Mensagens (cores intensas)
highlight ErrorMsg     guibg=#ff2d62 guifg=#ffffff
highlight WarningMsg   guibg=#ffaa00 guifg=#000000
highlight ModeMsg      guifg=#2dccb9 guibg=NONE
highlight MoreMsg      guifg=#00ccff guibg=NONE

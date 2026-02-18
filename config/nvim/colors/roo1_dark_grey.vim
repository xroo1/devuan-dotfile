" Esquema de cores Dark Modern - Ajustado com tons de cinza específicos

" Limpar configurações anteriores
highlight clear
syntax reset
set background=dark

" Configuração básica
let g:colors_name = "dark_modern"

" -----------------------------------------------------------
" Cores Principais (hierarquia de tons)
" -----------------------------------------------------------
highlight Normal       guibg=#191919 guifg=#c0c0c0  " Fundo base
highlight ColorColumn  guibg=#242424               " Colunas destacadas
highlight CursorLine   guibg=#212121 guifg=NONE    " Linha atual (ligeiramente mais clara)
highlight CursorLineNr guibg=#252525 guifg=#ffffff  " Número da linha atual (destaque)
highlight Cursor       guibg=#c0c0c0 guifg=#191919  " Cursor invertido
highlight LineNr       guibg=#222222 guifg=#777777  " Coluna de números (harmonizado)

" -----------------------------------------------------------
" Sintaxe (cores mantidas com melhor contraste)
" -----------------------------------------------------------
highlight Comment      guifg=#5a5a5a guibg=NONE    " Comentários mais visíveis
highlight Constant     guifg=#3ea28d guibg=NONE    " Verde água
highlight Identifier   guifg=#a8a8a8 guibg=NONE    " Identificadores neutros
highlight Statement    guifg=#EC1850 guibg=NONE    " Comandos em vermelho
highlight PreProc      guifg=#4dc5ce guibg=NONE    " Azul claro
highlight Type         guifg=#558188 guibg=NONE    " Azul esverdeado
highlight Special      guifg=#EC1850 guibg=NONE    " Especial em vermelho
highlight Underlined   gui=underline guifg=#4e4d80 " Sublinhado roxo
highlight Todo         guifg=#ffffff guibg=#EC1850 " TODOs destacados

" -----------------------------------------------------------
" Componentes de Interface
" -----------------------------------------------------------
" Barra de status
highlight StatusLine   guibg=#252525 guifg=#c0c0c0  " Ativa
highlight StatusLineNC guibg=#252525 guifg=#5a5a5a " Não ativa

" Menu suspenso
highlight Pmenu        guibg=#242424 guifg=#c0c0c0
highlight PmenuSel     guibg=#252525 guifg=#ffffff
highlight PmenuSbar    guibg=#212121
highlight PmenuThumb   guibg=#353535

" Divisórias
highlight VertSplit    guifg=#c0c0c0 guibg=#c0c0c0
highlight WinSeparator guifg=#393939 guibg=NONE
highlight NonText      guifg=#3a3a3a guibg=NONE
highlight SignColumn   guibg=#222222 guifg=#c0c0c0

" -----------------------------------------------------------
" Destaques e Interação
" -----------------------------------------------------------
" Busca e seleção
highlight Search       guibg=#4dc5ce guifg=#191919
highlight IncSearch    guibg=#558188 guifg=#191919
highlight Visual       guibg=#353535 guifg=#c0c0c0
highlight MatchParen   guibg=#252525 guifg=#EC1850

" Diff
highlight DiffAdd      guibg=#242424 guifg=#3ea28d
highlight DiffChange   guibg=#242424 guifg=#4dc5ce
highlight DiffDelete   guibg=#242424 guifg=#EC1850
highlight DiffText     guibg=#252525 guifg=#6ea2a5

" -----------------------------------------------------------
" Outros Elementos
" -----------------------------------------------------------
highlight Folded       guibg=#212121 guifg=#5a5a5a
highlight FoldColumn   guibg=#222222 guifg=#5a5a5a
highlight EndOfBuffer  guifg=#191919 guibg=NONE

" Mensagens
highlight ErrorMsg     guibg=#EC1850 guifg=#ffffff
highlight WarningMsg   guibg=#4dc5ce guifg=#ffcd5b
highlight ModeMsg      guifg=#3ea28d guibg=NONE
highlight MoreMsg      guifg=#3ea28d guibg=NONE

" Esquema de cores Dark Modern - Cores vibrantes com fundo 1B1D1E

" Limpar configurações anteriores
highlight clear
syntax reset
set background=dark

" Configuração básica
let g:colors_name = "dark_modern_vibrant"

" -----------------------------------------------------------
" Cores Principais (hierarquia de tons)
" -----------------------------------------------------------
highlight Normal       guibg=#1B1D1E guifg=#d0d0d0  " Fundo base
highlight ColorColumn  guibg=#242728               " Colunas destacadas
highlight CursorLine   guibg=#242728 guifg=NONE    " Linha atual
highlight CursorLineNr guibg=#242728 guifg=#ff6b9d  " Número da linha atual (rosa vibrante)
highlight Cursor       guibg=#ff6b9d guifg=#1B1D1E  " Cursor rosa
highlight LineNr       guibg=#242728 guifg=#888888  " Coluna de números

" -----------------------------------------------------------
" Sintaxe (cores mais vibrantes mas equilibradas)
" -----------------------------------------------------------
highlight Comment      guifg=#666666 guibg=NONE    " Comentários mais visíveis

" Cores principais mais vibrantes
highlight Constant     guifg=#2dffb5 guibg=NONE    " Verde água VIBRANTE
highlight Identifier   guifg=#c8c8c8 guibg=NONE    " Identificadores mais claros
highlight Statement    guifg=#ff2965 guibg=NONE    " Vermelho MAIS vibrante
highlight PreProc      guifg=#00e5ff guibg=NONE    " Azul claro VIBRANTE
highlight Type         guifg=#00c8d4 guibg=NONE    " Azul esverdeado MAIS forte
highlight Special      guifg=#ff2965 guibg=NONE    " Especial em vermelho vibrante
highlight Underlined   gui=underline guifg=#6b6bff " Azul roxo vibrante
highlight Todo         guifg=#ffffff guibg=#ff2965 " TODOs destacados

" Elementos específicos da sintaxe
highlight String       guifg=#2dffb5 guibg=NONE    " Strings no verde água
highlight Number       guifg=#ff6b9d guibg=NONE    " Números em rosa
highlight Boolean      guifg=#ff6b9d guibg=NONE    " Booleanos em rosa
highlight Function     guifg=#00e5ff guibg=NONE    " Funções em azul claro
highlight Conditional  guifg=#ff2965 guibg=NONE    " Condicionais em vermelho
highlight Repeat       guifg=#ff2965 guibg=NONE    " Loops em vermelho
highlight Operator     guifg=#ff6b9d guibg=NONE    " Operadores em rosa
highlight Keyword      guifg=#ff2965 guibg=NONE    " Palavras-chave em vermelho

" -----------------------------------------------------------
" Componentes de Interface
" -----------------------------------------------------------
" Barra de status
highlight StatusLine   guibg=#242728 guifg=#d0d0d0  " Ativa
highlight StatusLineNC guibg=#1F2122 guifg=#666666  " Não ativa

" Menu suspenso
highlight Pmenu        guibg=#242728 guifg=#d0d0d0
highlight PmenuSel     guibg=#ff6b9d guifg=#1B1D1E  " Seleção em rosa
highlight PmenuSbar    guibg=#1F2122
highlight PmenuThumb   guibg=#353535

" Divisórias
highlight VertSplit    guifg=#444444 guibg=#1B1D1E
highlight WinSeparator guifg=#444444 guibg=#1B1D1E
highlight NonText      guifg=#444444 guibg=#1B1D1E
highlight SignColumn   guibg=#242728 guifg=#d0d0d0

" Abas
highlight TabLine      guibg=#1F2122 guifg=#888888
highlight TabLineSel   guibg=#242728 guifg=#ff6b9d   " Aba ativa em rosa
highlight TabLineFill  guibg=#1B1D1E guifg=#1B1D1E

" -----------------------------------------------------------
" Destaques e Interação
" -----------------------------------------------------------
" Busca e seleção
highlight Search       guibg=#00e5ff guifg=#1B1D1E   " Busca em azul vibrante
highlight IncSearch    guibg=#ff6b9d guifg=#1B1D1E   " Busca incremental em rosa
highlight Visual       guibg=#353535 guifg=#d0d0d0
highlight MatchParen   guibg=#242728 guifg=#ff2965   " Parênteses correspondentes

" Diff
highlight DiffAdd      guibg=#1B1D1E guifg=#2dffb5   " Verde vibrante
highlight DiffChange   guibg=#1B1D1E guifg=#00e5ff   " Azul vibrante
highlight DiffDelete   guibg=#1B1D1E guifg=#ff2965   " Vermelho vibrante
highlight DiffText     guibg=#242728 guifg=#00c8d4   " Azul esverdeado

" -----------------------------------------------------------
" Outros Elementos
" -----------------------------------------------------------
highlight Folded       guibg=#1F2122 guifg=#666666
highlight FoldColumn   guibg=#242728 guifg=#666666
highlight EndOfBuffer  guifg=#1B1D1E guibg=#1B1D1E

" Mensagens
highlight ErrorMsg     guibg=#ff2965 guifg=#ffffff
highlight WarningMsg   guibg=#00e5ff guifg=#1B1D1E    " Aviso em azul vibrante
highlight ModeMsg      guifg=#2dffb5 guibg=NONE
highlight MoreMsg      guifg=#2dffb5 guibg=NONE

" -----------------------------------------------------------
" Git e versionamento
" -----------------------------------------------------------
highlight GitGutterAdd    guifg=#2dffb5 guibg=#242728
highlight GitGutterChange guifg=#00e5ff guibg=#242728
highlight GitGutterDelete guifg=#ff2965 guibg=#242728

" -----------------------------------------------------------
" NerdTree e file explorers
" -----------------------------------------------------------
highlight Directory    guifg=#00e5ff guibg=NONE
highlight NERDTreeDir  guifg=#00e5ff guibg=NONE

" -----------------------------------------------------------
" Verificação ortográfica
" -----------------------------------------------------------
highlight SpellBad     gui=undercurl guisp=#ff2965
highlight SpellCap     gui=undercurl guisp=#00e5ff
highlight SpellRare    gui=undercurl guisp=#ff6b9d
highlight SpellLocal   gui=undercurl guisp=#2dffb5

" -----------------------------------------------------------
" Destaques específicos
" -----------------------------------------------------------
highlight Title        guifg=#ff6b9d guibg=NONE
highlight Question     guifg=#2dffb5 guibg=NONE
highlight SpecialKey   guifg=#444444 guibg=NONE
highlight Whitespace   guifg=#444444 guibg=NONE

" -----------------------------------------------------------
" Ajustes para áreas flutuantes
" -----------------------------------------------------------
highlight NormalFloat  guibg=#242728 guifg=#d0d0d0
highlight FloatBorder  guibg=#242728 guifg=#444444

" -----------------------------------------------------------
" Garantir consistência dos fundos
" -----------------------------------------------------------
highlight Normal       guibg=#1B1D1E
highlight EndOfBuffer  guibg=#1B1D1E
highlight SignColumn   guibg=#242728
highlight LineNr       guibg=#242728
highlight CursorLineNr guibg=#242728
highlight StatusLine   guibg=#242728
highlight StatusLineNC guibg=#1F2122
highlight Pmenu        guibg=#242728
highlight TabLineSel   guibg=#242728
highlight TabLineFill  guibg=#1B1D1E
highlight ColorColumn  guibg=#242728
highlight FoldColumn   guibg=#242728
highlight VertSplit    guibg=#1B1D1E
highlight WinSeparator guibg=#1B1D1E
highlight NonText      guibg=#1B1D1E

" Links para consistência
highlight! link NERDTreeOpenable Directory
highlight! link NERDTreeClosable Directory
highlight! link NERDTreeExecFile String
highlight! link NERDTreeLinkTarget Type

" Garantir que o tema seja aplicado completamente
set termguicolors

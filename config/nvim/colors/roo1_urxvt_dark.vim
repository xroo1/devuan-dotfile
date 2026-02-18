" Esquema de cores Dark Modern - Cores vibrantes com fundo #111111
highlight clear
syntax reset
set background=dark

" Configuração básica
let g:colors_name = "roo1_urxvt_dark"

" -----------------------------------------------------------
" Cores Principais (hierarquia de tons)
" -----------------------------------------------------------
highlight Normal       guibg=#111111 guifg=#d0d0d0  " Fundo base mais escuro
highlight ColorColumn  guibg=#161616               " Colunas destacadas
highlight CursorLine   guibg=#161616 guifg=NONE    " Linha atual
highlight CursorLineNr guibg=#161616 guifg=#ff6b9d  " Número da linha atual (rosa vibrante)
highlight Cursor       guibg=#ff6b9d guifg=#111111  " Cursor rosa
highlight LineNr       guibg=#161616 guifg=#888888  " Coluna de números mais escura

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
highlight StatusLine   guibg=#161616 guifg=#d0d0d0  " Ativa
highlight StatusLineNC guibg=#121212 guifg=#666666  " Não ativa

" Menu suspenso
highlight Pmenu        guibg=#161616 guifg=#d0d0d0
highlight PmenuSel     guibg=#ff6b9d guifg=#111111  " Seleção em rosa
highlight PmenuSbar    guibg=#121212
highlight PmenuThumb   guibg=#252525

" Divisórias
highlight VertSplit    guifg=#333333 guibg=#111111
highlight WinSeparator guifg=#333333 guibg=#111111
highlight NonText      guifg=#333333 guibg=#111111
highlight SignColumn   guibg=#161616 guifg=#d0d0d0

" Abas
highlight TabLine      guibg=#121212 guifg=#888888
highlight TabLineSel   guibg=#161616 guifg=#ff6b9d   " Aba ativa em rosa
highlight TabLineFill  guibg=#111111 guifg=#111111

" -----------------------------------------------------------
" Destaques e Interação
" -----------------------------------------------------------
" Busca e seleção
highlight Search       guibg=#00e5ff guifg=#111111   " Busca em azul vibrante
highlight IncSearch    guibg=#ff6b9d guifg=#111111   " Busca incremental em rosa
highlight Visual       guibg=#252525 guifg=#d0d0d0
highlight MatchParen   guibg=#161616 guifg=#ff2965   " Parênteses correspondentes

" Diff
highlight DiffAdd      guibg=#111111 guifg=#2dffb5   " Verde vibrante
highlight DiffChange   guibg=#111111 guifg=#00e5ff   " Azul vibrante
highlight DiffDelete   guibg=#111111 guifg=#ff2965   " Vermelho vibrante
highlight DiffText     guibg=#161616 guifg=#00c8d4   " Azul esverdeado

" -----------------------------------------------------------
" Outros Elementos
" -----------------------------------------------------------
highlight Folded       guibg=#121212 guifg=#666666
highlight FoldColumn   guibg=#161616 guifg=#666666
highlight EndOfBuffer  guifg=#111111 guibg=#111111

" Mensagens
highlight ErrorMsg     guibg=#ff2965 guifg=#ffffff
highlight WarningMsg   guibg=#00e5ff guifg=#111111    " Aviso em azul vibrante
highlight ModeMsg      guifg=#2dffb5 guibg=NONE
highlight MoreMsg      guifg=#2dffb5 guibg=NONE

" -----------------------------------------------------------
" Git e versionamento
" -----------------------------------------------------------
highlight GitGutterAdd    guifg=#2dffb5 guibg=#161616
highlight GitGutterChange guifg=#00e5ff guibg=#161616
highlight GitGutterDelete guifg=#ff2965 guibg=#161616

" -----------------------------------------------------------
" NerdTree e file explorers
" -----------------------------------------------------------
highlight Directory    guifg=#00e5ff guibg=NONE
highlight NERDTreeDir  guifg=#00e5ff guibg=NONE
highlight NERDTreeCWD  guifg=#2dffb5 guibg=NONE
highlight NERDTreeUp   guifg=#666666 guibg=NONE

" Background do buffer do NERDTree
highlight NERDTree     guibg=#212121 guifg=#d0d0d0
highlight NERDTreeFile guifg=#d0d0d0 guibg=#212121
highlight NERDTreeExecFile guifg=#2dffb5 guibg=#212121

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
highlight SpecialKey   guifg=#333333 guibg=NONE
highlight Whitespace   guifg=#333333 guibg=NONE

" -----------------------------------------------------------
" Ajustes para áreas flutuantes
" -----------------------------------------------------------
highlight NormalFloat  guibg=#161616 guifg=#d0d0d0
highlight FloatBorder  guibg=#161616 guifg=#333333

" -----------------------------------------------------------
" Garantir consistência dos fundos
" -----------------------------------------------------------
highlight Normal       guibg=#111111
highlight EndOfBuffer  guibg=#111111
highlight SignColumn   guibg=#161616
highlight LineNr       guibg=#161616
highlight CursorLineNr guibg=#161616
highlight StatusLine   guibg=#161616
highlight StatusLineNC guibg=#121212
highlight Pmenu        guibg=#161616
highlight TabLineSel   guibg=#161616
highlight TabLineFill  guibg=#111111
highlight ColorColumn  guibg=#161616
highlight FoldColumn   guibg=#161616
highlight VertSplit    guibg=#111111
highlight WinSeparator guibg=#111111
highlight NonText      guibg=#111111

" Links para consistência
highlight! link NERDTreeOpenable Directory
highlight! link NERDTreeClosable Directory
highlight! link NERDTreeExecFile String
highlight! link NERDTreeLinkTarget Type



" Garantir que o tema seja aplicado completamente
set termguicolors

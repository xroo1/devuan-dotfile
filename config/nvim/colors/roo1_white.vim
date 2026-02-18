" Esquema de cores Light Modern - Tons de Azul Aprimorados
highlight clear
syntax reset
set background=light

let g:colors_name = "light_modern_blue"

" -----------------------------------------------------------
" Paleta de Azuis (Hierarquia de tons)
" -----------------------------------------------------------
let s:blue_dark     = '#0055aa'  " Azul mais intenso (ênfase)
let s:blue_medium   = '#0077cc'  " Azul principal
let s:blue_light    = '#0099dd'  " Azul claro (destaques)
let s:blue_pale     = '#bbddff'  " Azul muito claro (fundos)
let s:blue_teal     = '#1c6670'  " Azul esverdeado (tipos)

" -----------------------------------------------------------
" Cores Base
" -----------------------------------------------------------
highlight Normal       guibg=#ffffff guifg=#2a2a2a
highlight ColorColumn  guibg=#f5f9ff  " Fundo azul muito suave
highlight CursorLine   guibg=#f5f5f5 guifg=NONE
highlight CursorLineNr guibg=#eaf2ff guifg=#0077cc  " Azul médio
highlight LineNr       guibg=#f8f8f8 guifg=#88aacc  " Azul acinzentado

" -----------------------------------------------------------
" Sintaxe (Azuis diferenciados)
" -----------------------------------------------------------
highlight Comment      guifg=#888888 gui=italic
highlight Constant     guifg=#00786b  " Verde água mantido
highlight Identifier   guifg=#4a5d7a  " Azul acinzentado
highlight Statement    guifg=#cc3333 gui=bold  " Vermelho para estruturas
highlight PreProc      guifg=#0099dd  " Azul claro para pré-processador
highlight Type         guifg=#1c6670 gui=bold  " Azul esverdeado
highlight Special      guifg=#0055aa  " Azul escuro para especiais
highlight Underlined   guifg=#0077cc gui=underline
highlight Todo         guifg=#ffffff guibg=#cc3333  " Vermelho para TODOs

" -----------------------------------------------------------
" Interface (Azuis aplicados)
" -----------------------------------------------------------
" Barra de status
highlight StatusLine   guibg=#e0e8ff guifg=#0055aa gui=bold
highlight StatusLineNC guibg=#f0f4ff guifg=#6699cc

" Menu de autocompletar
highlight Pmenu        guibg=#f0f5ff guifg=#2a2a2a
highlight PmenuSel     guibg=#0077cc guifg=#ffffff gui=bold
highlight PmenuSbar    guibg=#d0e0ff
highlight PmenuThumb   guibg=#88bbee

" Divisores e bordas
highlight VertSplit    guifg=#cce0ff guibg=#cce0ff
highlight WinSeparator guifg=#aaccff guibg=NONE gui=bold

" -----------------------------------------------------------
" Destaques (Azuis em gradiente)
" -----------------------------------------------------------
highlight Search       guibg=#ddeeff guifg=#0055aa gui=bold
highlight IncSearch    guibg=#0077cc guifg=#ffffff gui=bold
highlight Visual       guibg=#cce4ff guifg=#003366
highlight MatchParen   guibg=#e0e8ff guifg=#0055aa gui=bold

" -----------------------------------------------------------
" Abas (Tabline - Destaque azul)
" -----------------------------------------------------------
highlight TabLine      guibg=#e0e8ff guifg=#6699cc
highlight TabLineSel   guibg=#ffffff guifg=#0055aa gui=bold
highlight TabLineFill  guibg=#eef5ff guifg=#eef5ff

" -----------------------------------------------------------
" Outros Ajustes
" -----------------------------------------------------------
" Diffs
highlight DiffAdd      guibg=#e6ffed guifg=#00786b
highlight DiffChange   guibg=#e6f3ff guifg=#0077cc
highlight DiffDelete   guibg=#ffebee guifg=#cc3333
highlight DiffText     guibg=#cce5ff guifg=#0055aa

" Mensagens
highlight ErrorMsg     guibg=#ffebee guifg=#cc3333 gui=bold
highlight WarningMsg   guifg=#cc9900 gui=bold
highlight ModeMsg      guifg=#0077cc gui=bold
highlight MoreMsg      guifg=#00786b
highlight EndOfBuffer  guifg=#ffffff guibg=NONE


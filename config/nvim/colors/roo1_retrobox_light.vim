" retrobox_light.vim - Tema retro com fundo amarelado claro
highlight clear
syntax reset
set background=light
let g:colors_name = "retrobox_light"

" -----------------------------------------------------------
" Paleta de Cores Modificada (fundo amarelado #fbf1c7)
" -----------------------------------------------------------
let s:bg_cream    = '#fbf1c7'    " Fundo amarelado claro
let s:bg_light    = '#f2e8b3'    " Realces mais claros
let s:fg_dark     = '#3c3836'    " Texto principal (cinza escuro)
let s:fg_medium   = '#665c54'    " Texto secundário
let s:red         = '#cc241d'    " Vermelho retro
let s:green       = '#98971a'    " Verde retro
let s:yellow      = '#d79921'    " Amarelo mostarda
let s:blue        = '#458588'    " Azul retro
let s:purple      = '#b16286'    " Roxo retro
let s:aqua        = '#689d6a'    " Verde-água
let s:orange      = '#d65d0e'    " Laranja terroso
let s:gray        = '#928374'    " Cinza para comentários

" -----------------------------------------------------------
" Configurações Base
" -----------------------------------------------------------
highlight Normal       guifg=#3c3836 guibg=#fbf1c7
highlight Cursor       guifg=#fbf1c7 guibg=#3c3836
highlight CursorLine   guibg=#f2e8b3 gui=NONE
highlight CursorLineNr guifg=#d79921 guibg=#f2e8b3 gui=bold
highlight LineNr       guifg=#928374 guibg=#f2e8b3
highlight ColorColumn  guibg=#f2e8b3

" -----------------------------------------------------------
" Sintaxe
" -----------------------------------------------------------
highlight Comment      guifg=#928374 gui=italic
highlight Constant     guifg=#98971a
highlight String       guifg=#98971a
highlight Number       guifg=#d65d0e
highlight Boolean      guifg=#d65d0e gui=bold
highlight Identifier   guifg=#3c3836
highlight Function     guifg=#458588
highlight Statement    guifg=#b16286 gui=bold
highlight Operator     guifg=#d79921
highlight Type         guifg=#d79921
highlight Special      guifg=#689d6a
highlight Todo         guifg=#fbf1c7 guibg=#d65d0e gui=bold

" -----------------------------------------------------------
" Interface
" -----------------------------------------------------------
highlight StatusLine   guifg=#3c3836 guibg=#ebdbb2 gui=bold
highlight StatusLineNC guifg=#928374 guibg=#ebdbb2
highlight VertSplit    guifg=#d5c4a1 guibg=#fbf1c7
highlight WinSeparator guifg=#d5c4a1 gui=bold
highlight Pmenu        guifg=#3c3836 guibg=#ebdbb2
highlight PmenuSel     guifg=#fbf1c7 guibg=#458588 gui=bold
highlight PmenuSbar    guibg=#d5c4a1
highlight PmenuThumb   guibg=#a89984
highlight TabLine      guifg=#928374 guibg=#ebdbb2
highlight TabLineSel   guifg=#d79921 guibg=#fbf1c7 gui=bold
highlight TabLineFill  guifg=#928374 guibg=#ebdbb2

" -----------------------------------------------------------
" Destaques
" -----------------------------------------------------------
highlight Visual       guifg=NONE    guibg=#d5c4a1
highlight Search       guifg=#3c3836 guibg=#d79921
highlight IncSearch    guifg=#fbf1c7 guibg=#b16286 gui=bold
highlight MatchParen   guifg=#d79921 guibg=#ebdbb2 gui=bold

" -----------------------------------------------------------
" Mensagens e Avisos
" -----------------------------------------------------------
highlight ErrorMsg     guifg=#cc241d guibg=NONE    gui=bold
highlight WarningMsg   guifg=#d79921 guibg=NONE    gui=bold
highlight ModeMsg      guifg=#98971a gui=bold
highlight MoreMsg      guifg=#458588 gui=bold

" -----------------------------------------------------------
" Destaques para Git
" -----------------------------------------------------------
highlight GitGutterAdd          guifg=#98971a guibg=#f2e8b3
highlight GitGutterChange       guifg=#d79921 guibg=#f2e8b3
highlight GitGutterDelete       guifg=#cc241d guibg=#f2e8b3
highlight GitGutterChangeDelete guifg=#d65d0e guibg=#f2e8b3

" -----------------------------------------------------------
" Destaques para LSP
" -----------------------------------------------------------
highlight LspDiagnosticsUnderlineError   gui=undercurl guisp=#cc241d
highlight LspDiagnosticsUnderlineWarning gui=undercurl guisp=#d79921

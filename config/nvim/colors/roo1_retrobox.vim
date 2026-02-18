" retrobox_mod.vim - Tema retro modificado com melhor contraste e cores mais vivas
highlight clear
syntax reset
set background=dark
let g:colors_name = "retrobox_mod"

" -----------------------------------------------------------
" Paleta de Cores Modificada
" -----------------------------------------------------------
let s:bg_dark      = '#1a1a1a'    " Fundo mais escuro
let s:bg_light     = '#252525'    " Fundo para realces
let s:fg_main      = '#e0d8c0'    " Texto principal (bege retro)
let s:fg_light     = '#f0e8d0'    " Texto destacado
let s:gray         = '#5a5a5a'    " Cinza para comentários
let s:red          = '#ff6b6b'    " Vermelho mais vivo
let s:green        = '#98c379'    " Verde menta
let s:yellow       = '#e5c07b'    " Amarelo ouro
let s:blue         = '#61afef'    " Azul céu
let s:purple       = '#c678dd'    " Roxo lavanda
let s:cyan         = '#56b6c2'    " Ciano esverdeado
let s:orange       = '#d19a66'    " Laranja terroso
let s:pink         = '#e866ea'    " Rosa fluorescente
let s:accent       = '#ffcc66'    " Amarelo-âmbar (novo acento)

" -----------------------------------------------------------
" Configurações Base
" -----------------------------------------------------------
highlight Normal       guifg=#e0d8c0 guibg=#1a1a1a
highlight Cursor       guifg=#1a1a1a guibg=#e0d8c0
highlight CursorLine   guibg=#252525 gui=NONE
highlight CursorLineNr guifg=#ffcc66 guibg=#252525 gui=bold
highlight LineNr       guifg=#5a5a5a guibg=#252525
highlight ColorColumn  guibg=#252525

" -----------------------------------------------------------
" Sintaxe
" -----------------------------------------------------------
highlight Comment      guifg=#5a5a5a gui=italic
highlight Constant     guifg=#98c379
highlight String       guifg=#98c379
highlight Number       guifg=#d19a66
highlight Boolean      guifg=#d19a66 gui=bold
highlight Identifier   guifg=#e0d8c0
highlight Function     guifg=#61afef
highlight Statement    guifg=#c678dd gui=bold
highlight Operator     guifg=#ffcc66
highlight Type         guifg=#e5c07b
highlight Special      guifg=#56b6c2
highlight Todo         guifg=#1a1a1a guibg=#ffcc66 gui=bold

" -----------------------------------------------------------
" Interface
" -----------------------------------------------------------
highlight StatusLine   guifg=#e0d8c0 guibg=#252525 gui=bold
highlight StatusLineNC guifg=#5a5a5a guibg=#252525
highlight VertSplit    guifg=#3a3a3a guibg=#1a1a1a
highlight WinSeparator guifg=#3a3a3a gui=bold
highlight Pmenu        guifg=#e0d8c0 guibg=#252525
highlight PmenuSel     guifg=#1a1a1a guibg=#61afef gui=bold
highlight PmenuSbar    guibg=#3a3a3a
highlight PmenuThumb   guibg=#5a5a5a
highlight TabLine      guifg=#5a5a5a guibg=#252525
highlight TabLineSel   guifg=#ffcc66 guibg=#1a1a1a gui=bold
highlight TabLineFill  guifg=#5a5a5a guibg=#252525

" -----------------------------------------------------------
" Destaques
" -----------------------------------------------------------
highlight Visual       guifg=NONE    guibg=#3a3a3a
highlight Search       guifg=#1a1a1a guibg=#ffcc66
highlight IncSearch    guifg=#1a1a1a guibg=#e866ea gui=bold
highlight MatchParen   guifg=#ffcc66 guibg=#3a3a3a gui=bold

" -----------------------------------------------------------
" Mensagens e Avisos
" -----------------------------------------------------------
highlight ErrorMsg     guifg=#ff6b6b guibg=NONE    gui=bold
highlight WarningMsg   guifg=#e5c07b guibg=NONE    gui=bold
highlight ModeMsg      guifg=#98c379 gui=bold
highlight MoreMsg      guifg=#61afef gui=bold

" -----------------------------------------------------------
" Destaques para Git
" -----------------------------------------------------------
highlight GitGutterAdd          guifg=#98c379 guibg=#252525
highlight GitGutterChange       guifg=#e5c07b guibg=#252525
highlight GitGutterDelete       guifg=#ff6b6b guibg=#252525
highlight GitGutterChangeDelete guifg=#d19a66 guibg=#252525

" -----------------------------------------------------------
" Destaques para LSP
" -----------------------------------------------------------
highlight LspDiagnosticsUnderlineError   gui=undercurl guisp=#ff6b6b
highlight LspDiagnosticsUnderlineWarning gui=undercurl guisp=#e5c07b

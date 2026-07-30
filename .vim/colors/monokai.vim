" Monokai colorscheme
" Matches the classic Monokai palette (the same base palette used by
" bat's built-in "Monokai Extended" theme).

hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'monokai'

let s:bg        = ['#272822', 235]
let s:bg_alt    = ['#3E3D32', 237]
let s:selection = ['#49483E', 238]
let s:fg        = ['#F8F8F2', 15]
let s:comment   = ['#75715E', 243]
let s:red       = ['#F92672', 197]
let s:orange    = ['#FD971F', 208]
let s:yellow    = ['#E6DB74', 186]
let s:green     = ['#A6E22E', 148]
let s:blue      = ['#66D9EF', 81]
let s:purple    = ['#AE81FF', 141]
let s:gutter_fg = ['#90908A', 244]
let s:none      = ['NONE', 'NONE']
" Slightly lighter than the terminal's own default fg (iTerm2 profile is
" Solarized Dark, default fg = base0 #839496); this is Solarized's base1,
" the palette's built-in "one step lighter" shade for regular text.
let s:text      = ['#93A1A1', 245]

function! s:hi(group, fg, bg, attr)
  let l:cmd = 'hi ' . a:group
  let l:cmd .= ' guifg=' . a:fg[0] . ' ctermfg=' . a:fg[1]
  let l:cmd .= ' guibg=' . a:bg[0] . ' ctermbg=' . a:bg[1]
  let l:cmd .= ' gui=' . a:attr . ' cterm=' . a:attr
  execute l:cmd
endfunction

" Editor UI
" NOTE: groups below use s:none for bg (instead of s:bg) so the terminal's
" own background shows through instead of being overridden with Monokai's
" dark grey. Normal uses s:text (a shade lighter than the terminal's own
" default fg) instead of Monokai's off-white or the terminal default.
call s:hi('Normal',        s:text,      s:none,      'NONE')
call s:hi('NonText',       s:bg_alt,    s:none,      'NONE')
call s:hi('LineNr',        s:gutter_fg, s:none,      'NONE')
call s:hi('CursorLineNr',  s:yellow,    s:none,      'NONE')
call s:hi('CursorLine',    s:none,      s:bg_alt,    'NONE')
call s:hi('Cursor',        s:bg,        s:fg,        'NONE')
call s:hi('Visual',        s:none,      s:selection, 'NONE')
call s:hi('Search',        s:bg,        s:yellow,    'NONE')
call s:hi('IncSearch',     s:bg,        s:orange,    'NONE')
call s:hi('StatusLine',    s:bg,        s:gutter_fg, 'NONE')
call s:hi('StatusLineNC',  s:bg,        s:comment,   'NONE')
call s:hi('VertSplit',     s:bg_alt,    s:none,      'NONE')
call s:hi('Pmenu',         s:fg,        s:bg_alt,    'NONE')
call s:hi('PmenuSel',      s:bg,        s:green,     'NONE')
call s:hi('MatchParen',    s:bg,        s:orange,    'bold')
call s:hi('SignColumn',    s:gutter_fg, s:none,      'NONE')
call s:hi('ColorColumn',   s:none,      s:bg_alt,    'NONE')
call s:hi('Directory',     s:blue,      s:none,      'NONE')
call s:hi('Error',         s:red,       s:none,      'bold')
call s:hi('ErrorMsg',      s:red,       s:none,      'bold')
call s:hi('WarningMsg',    s:orange,    s:none,      'bold')
call s:hi('Todo',          s:bg,        s:yellow,    'bold')
call s:hi('DiffAdd',       s:green,     s:bg_alt,    'NONE')
call s:hi('DiffChange',    s:yellow,    s:bg_alt,    'NONE')
call s:hi('DiffDelete',    s:red,       s:bg_alt,    'NONE')
call s:hi('DiffText',      s:orange,    s:bg_alt,    'bold')

" Syntax
call s:hi('Comment',       s:comment,   s:none,      'italic')
call s:hi('Constant',      s:purple,    s:none,      'NONE')
call s:hi('String',        s:yellow,    s:none,      'NONE')
call s:hi('Character',     s:yellow,    s:none,      'NONE')
call s:hi('Number',        s:purple,    s:none,      'NONE')
call s:hi('Boolean',       s:purple,    s:none,      'NONE')
call s:hi('Float',         s:purple,    s:none,      'NONE')
call s:hi('Identifier',    s:blue,      s:none,      'NONE')
call s:hi('Function',      s:green,     s:none,      'bold')
call s:hi('Statement',     s:red,       s:none,      'NONE')
call s:hi('Conditional',   s:red,       s:none,      'NONE')
call s:hi('Repeat',        s:red,       s:none,      'NONE')
call s:hi('Label',         s:red,       s:none,      'NONE')
call s:hi('Operator',      s:red,       s:none,      'NONE')
call s:hi('Keyword',       s:red,       s:none,      'NONE')
call s:hi('Exception',     s:red,       s:none,      'NONE')
call s:hi('PreProc',       s:red,       s:none,      'NONE')
call s:hi('Include',       s:blue,      s:none,      'NONE')
call s:hi('Define',        s:red,       s:none,      'NONE')
call s:hi('Macro',         s:red,       s:none,      'NONE')
call s:hi('PreCondit',     s:red,       s:none,      'NONE')
call s:hi('Type',          s:blue,      s:none,      'NONE')
call s:hi('StorageClass',  s:orange,    s:none,      'italic')
call s:hi('Structure',     s:red,       s:none,      'NONE')
call s:hi('Typedef',       s:blue,      s:none,      'NONE')
call s:hi('Special',       s:orange,    s:none,      'NONE')
call s:hi('SpecialChar',   s:orange,    s:none,      'NONE')
call s:hi('Tag',           s:red,       s:none,      'NONE')
call s:hi('Delimiter',     s:fg,        s:none,      'NONE')
call s:hi('SpecialComment',s:comment,   s:none,      'bold')
call s:hi('Underlined',    s:blue,      s:none,      'underline')
call s:hi('Ignore',        s:comment,   s:none,      'NONE')

delfunction s:hi

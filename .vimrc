"Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'w0rp/ale'
Plugin 'git://github.com/StanAngeloff/php.vim.git'
Plugin 'chriskempson/base16-vim'
Plugin 'git://github.com/tpope/vim-repeat.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/wincent/scalpel.git'
Plugin 'git://github.com/wincent/loupe.git'
Plugin 'git://github.com/mileszs/ack.vim.git'
Plugin 'git://github.com/junegunn/vim-easy-align.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'udalov/kotlin-vim'
Plugin 'hsanson/vim-android'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'alvan/vim-php-manual'
Plugin 'SirVer/ultisnips'
call vundle#end()            " required
filetype plugin indent on    " required
"End Vundle stuff

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

let base16colorspace=256
let g:base16_shell_path='~/.zsh/base16-shell/scripts'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = $HOME . '/dev/dotfiles/ultisnips'
let g:UltiSnipsSnippetDirectories = [$HOME . '/dev/dotfiles/ultisnips']

let g:ulti_expand_res = 0
function! ExpandTab()
  call UltiSnips#ExpandSnippet()
  if (g:ulti_expand_res)
    return ''
  endif
  return '<tab>'
endfunction

autocmd BufEnter *.erl hi erlangLocalFuncRef ctermbg=NONE guibg=NONE
autocmd BufEnter *.erl hi erlangLocalFuncCall ctermbg=NONE guibg=NONE
autocmd BufEnter *.erl hi erlangGlobalFuncRef ctermbg=NONE guibg=NONE
autocmd BufEnter *.erl hi erlangGlobalFuncCall ctermbg=NONE guibg=NONE

"hi erlangAtom term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
"hi erlangQuotedAtom term=bold ctermfg=Cyan guifg=#80a0ff gui=bold

set t_ut=

let g:php_manual_online_search_shortcut = ''

"let g:ale_lint_on_text_changed = 'never'

let g:ale_sign_column_always = 1
let g:ale_sign_error = '≫'
let g:ale_sign_warning = '≫'

let g:ale_erlang_erlc_options = '-I apps/twapi/include'

autocmd BufReadPost *.java let g:ale_java_javac_classpath = javacomplete#server#GetClassPath()

let g:ale_php_phan_use_client = 1
let g:ale_php_phan_executable = '/home/mikael/phan/phan_client'

hi phpKeyword ctermfg=6 guifg=#0184bc

" Deoplete tab to cycle completions
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Deoplete enter to complete
"inoremap <expr><cr> pumvisible() ? "\<c-p>\<c-n>\<c-y>" : "\<cr>"

"EasyAlign maps
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"General settings
set nonumber           "Show no line number
"set cursorline       "Highlight cursor line
set laststatus=2     "Always show status line
set lazyredraw       "Don't update screen during macro playback
set nojoinspaces     "Don't autoinsert two spaces after join command
set scrolloff=3      "Start scrolling 3 lines before edge of viewport
set sidescrolloff=3  "Same as scrolloff but for columns
set switchbuf=usetab "Try to reuse windows/tabs when switching buffers
set textwidth=100    "Automatically hard wrap at 100 columns
set shellpipe=>      "Don't leak grep to terminal
set inccommand=nosplit "Live update :substitute

"File settings
set nobackup      "Don't create backup files
set nowritebackup "Don't create backup files
set noswapfile    "Don't create swap files
set noundofile    "Don't create undo files

"Tab settings
set smarttab     "Indent/dedent in leading whitespace
set shiftround   "Always indent by multiple of shiftwith
set expandtab    "Convert tabs to spaces

"Number of spaces for tab key
autocmd BufEnter,FocusGained,VimEnter,WinEnter *                  set tabstop=4
autocmd BufEnter,FocusGained,VimEnter,WinEnter */origin/*,*.vimrc set tabstop=2

"Number of spaces for tab key
autocmd BufEnter,FocusGained,VimEnter,WinEnter *                  set softtabstop=4
autocmd BufEnter,FocusGained,VimEnter,WinEnter */origin/*,*.vimrc set softtabstop=2

"Number of spaces for autoindent
autocmd BufEnter,FocusGained,VimEnter,WinEnter *                  set shiftwidth=4
autocmd BufEnter,FocusGained,VimEnter,WinEnter */origin/*,*.vimrc set shiftwidth=2

autocmd BufEnter,FocusGained,VimEnter,WinEnter *.zsh-theme set filetype=zsh

"Show whitespace settings
set list
set listchars=nbsp:⦸
set listchars+=tab:▷▷

if has('linebreak')
  set breakindent "Indent wrapped lines to match start
  if exists('&breakindentopt')
    set breakindentopt=shift:2 "Indent wrapped lines once more
  endif
  let &showbreak='↳ '
endif

if exists('&belloff')
  set belloff=all "Never ring bell
endif

"Create window focus by highlighting lines
if exists('+colorcolumn')
  "let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

set nonumber

if has('windows')
  set splitbelow "Open horizontal splits below
endif

if has('vertsplit')
  set splitright "Open vertical splits to the right
endif

if has('termguicolors')
  set termguicolors "Use 256-bit colors if terminal supports it
endif

if has('virtualedit')
  set virtualedit=block "Allows cursor to move where there is no text in visual block mode
endif

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Use Ripgrep instead of Ack
if executable('rg')
  set grepprg=ag\ --vimgrep\ --no-heading
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" Run command in background on save.
autocmd BufWritePost */dev/origin/*,*/dev/twapi/* :silent call jobstart("stage-sync")

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let mapleader = ' '

"nnoremap <leader>h :call phpcd#JumpToDefinition('normal')<cr>
"nnoremap <leader>s :call phpcd#JumpToDefinition('split')<cr>
"nnoremap <leader>u :call phpcd#JumpBack()<cr>

" Pane switching
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
tnoremap <c-j>h <c-\><c-n><c-w>h
tnoremap <c-k>j <c-\><c-n><c-w>j
tnoremap <c-h>k <c-\><c-n><c-w>k
tnoremap <c-l>l <c-\><c-n><c-w>l

tnoremap <esc> <c-\><c-n>

inoremap <c-t> <c-p>
inoremap <c-n> <c-n>
xnoremap <c-t> <c-p>


" Clipboard copy/paste
nnoremap <c-p> h"+p
inoremap <c-p> <esc>"+pa
cnoremap <c-p> <c-r>+
vnoremap <c-p> "+p
vnoremap <c-y> "+y

nnoremap <c-g> :call ToggleList()<cr>

" Folding maps
"nnoremap <tab> za
"nnoremap <s-tab> zM
"nnoremap <leader><tab> zR

nnoremap <leader>a :call ToggleAtomBinary()<cr>
nnoremap <leader>o :call ToggleCamelSnakeCase()<cr>

vnoremap s :s/\v%V

let php_var_selector_is_identifier=1

filetype plugin on
syntax on

function! ToggleAtomBinary()
  let x = col('.')
  let y = line('.')
  normal! diwP
  if strcharpart(getline('.'), col('.'), 3) == '">>'
    normal! b3h3xel3x
    call cursor(y, x - 3)
  else
    exec "normal! ciw<<\"\<esc>pa\">>\<esc>"
    call cursor(y, x + 3)
  endif
endfunction

function! ToggleCamelSnakeCase()
  let x = col('.')
  let y = line('.')
  exec "normal! viw"

  let selection = GetVisualSelection()
  if matchstr(selection, '\v\u') != ""
    '<,'>s/\v%V(\w)(\u)/\1_\L\2/g
    exec "normal! \<esc>viw"
    silent! '<,'>s/\v%V(\u)/\L\1/
  else
    '<,'>s/\v%V_(\w)/\U\1/g
  endif

  call cursor(y, x)
  exec "normal! \<esc>"
endfunction

function! GetVisualSelection() abort
  try
    let a_save = @a
    silent! normal! "ay
    return @a
  finally
    let @a = a_save
  endtry
endfunction

" Make current window more obvious by turning off/adjusting some features in non-current windows.
if exists('+colorcolumn')
  autocmd BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn='+' . join(range(0, 254), ',+')
  autocmd FocusLost,WinLeave * let &l:colorcolumn=join(range(1, 255), ',')
endif

inoremap {<CR> {<CR>}<Esc>O

" autocmd Filetype php inoremap ;i if<Space>()<Space>{<CR>}<Esc>O..<Esc>?(<CR>a
" autocmd Filetype php inoremap ;f foreach<Space>()<Space>{<CR>}<Esc>O..<Esc>?(<CR>a
" autocmd Filetype php inoremap ;w while<Space>()<Space>{<CR>}<Esc>O..<Esc>?(<CR>a
" autocmd Filetype php inoremap ;s switch<Space>()<Space>{<CR>}<Esc>Ocase<Space>..<Esc>?(<CR>a
" autocmd Filetype php inoremap ;c class<Space>()<Space>{<CR>}<Esc>O..<Esc>?(<CR>ca(
" autocmd Filetype php inoremap ;p public<Space>function<Space>(..)<Space>{<CR>}<Esc>O..<Esc>?(<CR>i

" autocmd Filetype php inoremap .. <Esc>/\.\.<CR>c2l

function! Extend()
  normal! $w[{
  let statement_signature = getline('.')
  echo statement_signature
  if matchstr(statement_signature, '\<if\>\|\<elseif\>') != ''
    normal! %j
    let line_below = getline('.')
    if matchstr(line_below, '\<else') != ''
      execute "normal! Oelseif\<Space>()\<Space>{\<Cr>}\<Esc>O..\<Esc>?)\<Cr>"
      startinsert
    else
      execute "normal! Oelse\<Space>{\<Cr>}\<Esc>O"
    endif
  elseif matchstr(statement_signature, '\<else\>') != ''
    execute "normal! beaif\<Space>()\<Esc>h"
    startinsert
  endif
endfunction

function! ToggleList()
  let [x1, y1] = FindScopeStart(-1, 0)
  if (y1 == -1)
    let [x1, y1] = FindScopeStart(1, 0)
    if (y1 == -1)
      let [x1, y1] = FindScopeStart(-1, 1)
    endif
  endif
  let [x2, y2] = FindScopeEnd([x1, y1], 1, 1)

  if (y1 == -1 || y2 == -1)
    echo 'Unable to find scope'
    return
  endif

  if (y1 == y2)
    echo 'unfold'
    call UnfoldList(y1, x1, x2)
    call cursor(y1 + 1, x1)
  else
    echo 'fold'
    call FoldList(y1, y2)
    call cursor(y1, x1 + 1)
  endif
endfunction

function! FoldList(y1, y2)
  execute 'silent! ' . (a:y1 + 1) . ',' . a:y2 . ':s/\v^\s+//g'
  execute 'silent! ' . a:y1 . ',' . (a:y2 - 1) . ':s/\v\s*\n//g'
  execute 'silent! ' . a:y1 . ',' . a:y1 . ':s/\v,(\S)/, \1/g'
endfunction

function! UnfoldList(y, x1, x2)
  let scope_map = GetScopeMap()
  call cursor(a:y, a:x2)
  normal! i@@
  call cursor(a:y, a:x1)
  normal! a@@
  let x = a:x1 + 2
  let x2 = a:x2 + 4
  let quote_map = GetQuoteMap(x, a:y)

  while (x < x2)
    let char = GetCharAt(x, a:y)

    call UpdateQuoteMap(x, a:y, quote_map)
    if (!InQuotes(quote_map))
      if (IsScopeDelimiter(char))
        let scope_map[char] = scope_map[char] + 1
      endif

      if (char == ',' && InStartScope(scope_map))
        call cursor(a:y, x + 1)
        normal! a@@
        let x = x + 2
        let x2 = x2 + 2
      endif
    endif

    let x = x + 1
  endwhile
  execute a:y . ',' a:y . ':s/\v\@\@/\r/g'
  execute 'normal! V' . a:y . 'G='
endfunction

function! FindScopeStart(direction, search_multi_line)
  return FindScopeDelimiter('start', a:direction, a:search_multi_line)
endfunction

function! FindScopeEnd(start_pos, direction, search_multi_line)
  return FindScopeDelimiter('end', a:direction, a:search_multi_line, a:start_pos)
endfunction

function! FindScopeDelimiter(type, direction, search_multi_line, ...)
  let [x, y] = a:0 > 0 ? a:1 : [getcurpos()[2], getcurpos()[1]]
  let n = a:direction
  let scope_map = GetScopeMap()
  let quote_map = GetQuoteMap(x, y)

  if (!InQuotes(quote_map))
    call FixStartAtDelimiter(x, y, a:type, scope_map)
  endif

  let line = getline(y)
  while (!empty(line))
    while (strgetchar(line, x - 1) != -1)
      let char = GetCharAt(x, y)
      call UpdateQuoteMap(x, y, quote_map)

      if(!InQuotes(quote_map))
        call UpdateScopeMap(char, scope_map)

        if (AtScopeDelimiter(a:type, scope_map))
          return [x, y]
        endif
      endif
      let x = x + n
    endwhile

    if (!a:search_multi_line)
      return [-1, -1]
    endif

    let y = y + n
    let line = getline(y)
    let x = n == -1 ? len(line) : 1
  endwhile
  return [-1, -1]
endfunction

function! FixStartAtDelimiter(x, y, type, map)
  let char = GetCharAt(a:x, a:y)
  if (a:type == 'start' && IsScopeEndDelimiter(char) ||
      \a:type == 'end' && IsScopeStartDelimiter(char))
    let a:map[char] = -1
  endif
endfunction

function! GetCharAt(x, y)
  let line = getline(a:y)
  if (empty(line))
    return ''
  endif

  let char = strgetchar(line, a:x - 1)
  if (char == -1)
    return ''
  endif

  return nr2char(char)
endfunction

function! UpdateQuoteMap(x, y, map)
  if (GetCharAt(a:x - 1, a:y) == '\')
    return
  endif

  let char = GetCharAt(a:x, a:y)
  if (char == "'" && a:map['"'] == 0 && a:map['`'] == 0 ||
     \char == '"' && a:map["'"] == 0 && a:map['`'] == 0 ||
     \char == "`" && a:map['"'] == 0 && a:map["'"] == 0)
    let a:map[char] = (a:map[char] + 1) % 2
  endif
endfunction

function! GetQuoteMap(x, y)
  let map = {'"': 0, "'": 0, '`': 0}

  let i = 0
  while (i <= a:x)
    call UpdateQuoteMap(i, a:y, map)
    let i = i + 1
  endwhile

  return map
endfunction

function! InQuotes(map)
  return a:map["'"] > 0 || a:map['"'] > 0 || a:map['`'] > 0
endfunction

function! UpdateScopeMap(char, map)
  if (IsScopeDelimiter(a:char))
    let a:map[a:char] = a:map[a:char] + 1
  endif
endfunction

function! GetScopeMap()
  return {'[': 0, ']': 0, '(': 0, ')': 0, '{': 0, '}': 0}
endfunction

function! IsScopeDelimiter(c)
  return IsScopeStartDelimiter(a:c) || IsScopeEndDelimiter(a:c)
endfunction

function! IsScopeStartDelimiter(c)
  return a:c == '[' || a:c == '(' || a:c == '{'
endfunction

function! IsScopeEndDelimiter(c)
  return a:c == ']' || a:c == ')' || a:c == '}'
endfunction

function! AtScopeDelimiter(type, map)
  let n = a:type == 'start' ? 1 : -1
  return a:map['['] - a:map[']'] == n ||
        \a:map['('] - a:map[')'] == n ||
        \a:map['{'] - a:map['}'] == n
endfunction

function! InStartScope(map)
  return a:map['['] == a:map[']'] && a:map['('] == a:map[')'] && a:map['{'] == a:map['}']
endfunction

" ---------------------------

function! CreateForeach()
  let matches = matchlist(getline('.'), '\v^(\s*)(\$)?(.{-})(s)?\s*$')
  if (matches[0] == '')
    echo 'Error no matches'
    return
  endif

  let indent = matches[1]

  if (matches[4] == 's')
    let list    = '$' . matches[3] . matches[4]
    let element = '$' . matches[3]
  else
    let list    = '$' . matches[3]
    let element = '$value'
  endif
  stopinsert
  call append(line('.'), [
    \indent . 'foreach (' . list . ' as ' . element . ') {',
    \indent,
    \indent . '}'
  \])
  execute "normal! ddjA\<tab>"
  startinsert!
endfunction

inoremap <c-f> <esc>:call CreateForeach()<cr>

"Vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/syntastic'
Plugin 'git://github.com/StanAngeloff/php.vim.git'
Plugin 'chriskempson/base16-vim'
Plugin 'git://github.com/tpope/vim-repeat.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/wincent/scalpel.git'
Plugin 'git://github.com/wincent/loupe.git'
Plugin 'git@github.com:mileszs/ack.vim.git'
Plugin 'git@github.com:junegunn/vim-easy-align.git'
Plugin 'git@github.com:easymotion/vim-easymotion.git'
Plugin 'christoomey/vim-tmux-navigator'
call vundle#end()            " required
filetype plugin indent on    " required
"End Vundle stuff

"EasyAlign maps
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

so ~/.vim/color.vim

"General settings
set number           "Show line number
set cursorline       "Highlight cursor line
set laststatus=2     "Always show status line
set lazyredraw       "Don't update screen during macro playback
set nojoinspaces     "Don't autoinsert two spaces after join command
set scrolloff=3      "Start scrolling 3 lines before edge of viewport
set sidescrolloff=3  "Same as scrolloff but for columns
set switchbuf=usetab "Try to reuse windows/tabs when switching buffers
set textwidth=100    "Automatically hard wrap at 100 columns
set shellpipe=>      "Don't leak grep to terminal

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
  let &l:colorcolumn='+' . join(range(0, 254), ',+')
endif

if exists('+relativenumber')
  set relativenumber "Show relative line numbers
endif

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
" TODO stage-sync in origin/twapi
autocmd BufWritePost * :silent exec "!echo hello"

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

let mapleader = ' '

" Pane switching
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Clipboard copy/paste
nnoremap <c-p> "+p
nnoremap <c-P> "+P
inoremap <c-p> <esc>"+pa
inoremap <c-P> <esc>"+Pa
vnoremap <c-y> "+y

nnoremap <c-g> :call ToggleList()<cr>

let php_var_selector_is_identifier=1

filetype plugin on
syntax on

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
  let [x1, y1] = FindScopeStart()
  let [x2, y2] = FindScopeEnd()

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
  let map = GetScopeMap()
  call cursor(a:y, a:x2)
  normal! i@@
  call cursor(a:y, a:x1)
  normal! a@@
  let x = a:x1 + 2
  let x2 = a:x2 + 4

  while (x < x2)
    let line = getline(a:y)
    let char = nr2char(strgetchar(line, x))
    if (IsScopeDelimiter(char))
      let map[char] = map[char] + 1
    endif

    let x = x + 1

    if (char == ',' && InStartScope(map))
      call cursor(a:y, x)
      normal! a@@
      let x = x + 2
      let x2 = x2 + 2
    endif
  endwhile
  execute a:y . ',' a:y . ':s/\v\@\@/\r/g'
  execute 'normal! V' . a:y . 'G='
endfunction

function! FindScopeStart()
  return FindScopeDelimiter('start')
endfunction

function! FindScopeEnd()
  return FindScopeDelimiter('end')
endfunction

function! FindScopeDelimiter(direction)
  let n = a:direction == 'start' ? -1 : 1

  let map = GetScopeMap()
  let y = getcurpos()[1]
  let x = getcurpos()[2] - 1
  let line = getline(y)

  while (!empty(line))
    while (strgetchar(line, x) != -1)
      let char = nr2char(strgetchar(line, x))

      if (IsScopeDelimiter(char))
        let map[char] = map[char] + 1
      endif

      if ((a:direction == 'start' && AtScopeStart(map)) || (a:direction == 'end' && AtScopeEnd(map)))
        return [x + 1, y]
      endif
      let x = x + n
    endwhile

    let y = y + n
    let line = getline(y)
    let x = a:direction == 'start' ? len(line) - 1 : 0
  endwhile
  return [-1, -1]
endfunction

function! GetScopeMap()
  return {'[': 0, ']': 0, '(': 0, ')': 0, '{': 0, '}': 0}
endfunction

function! IsScopeDelimiter(c)
  return a:c == '[' || a:c == ']' || a:c == '(' || a:c == ')' || a:c == '{' || a:c == '}'
endfunction

function! AtScopeStart(map)
  return a:map['['] > a:map[']'] || a:map['('] > a:map[')'] || a:map['{'] > a:map['}']
endfunction

function! AtScopeEnd(map)
  return a:map['['] < a:map[']'] || a:map['('] < a:map[')'] || a:map['{'] < a:map['}']
endfunction

function! InStartScope(map)
  return a:map['['] == a:map[']'] && a:map['('] == a:map[')'] && a:map['{'] == a:map['}']
endfunction


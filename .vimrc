
" Auto install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set rtp +=~/.vim
call plug#begin('~/.vim/plugged')
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-dispatch'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
"Plug 'OmniSharp/omnisharp-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/vim-plug'
"Plug 'wincent/command-t', { 'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make' }
"Plug 'w0rp/ale'
"Plug 'haishanh/night-owl.vim'
Plug 'folke/tokyonight.nvim'
"Plug 'git://github.com/StanAngeloff/php.vim.git'
"Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'wincent/scalpel'
Plug 'wincent/loupe'
Plug 'mileszs/ack.vim'
Plug 'junegunn/vim-easy-align'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
"Plug 'udalov/kotlin-vim'
"Plug 'hsanson/vim-android'
"Plug 'artur-shaik/vim-javacomplete2'
"Plug 'alvan/vim-php-manual'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
"Plug 'ElmCast/elm-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-speeddating'
call plug#end()

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_Background
endif

"let g:CommandTFileScanner = 'find'
"let g:CommandTTraverseSCM = 'dir'
"let g:CommandTWildIgnore = &wildignore . ',*/_build/*,*.beam'
"let g:CommandTCancelMap = '<esc>'

"let base16colorspace=256
"let g:base16_shell_path='~/.zsh/base16-shell/scripts'

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

"let g:OmniSharp_server_install = '/home/mkajsjo/.omnisharp/server/'
"let g:OmniSharp_timeout = 0
"autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
"let g:ale_linters = { 'cs': ['OmniSharp'] }
"let g:OmniSharp_diagnostic_showid = 1

"hi erlangAtom term=bold ctermfg=Cyan guifg=#80a0ff gui=bold
"hi erlangQuotedAtom term=bold ctermfg=Cyan guifg=#80a0ff gui=bold

set t_ut=

let g:php_manual_online_search_shortcut = ''

"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '≫'
"let g:ale_sign_warning = '≫'

"let g:ale_erlang_erlc_options = '-I apps/twapi/include'

"let g:ale_linters = {'cs': ['csc']}
"let g:ale_cs_csc_source= '/home/mikael/dev/Captario-SUM'

"autocmd BufReadPost *.java let g:ale_java_javac_classpath = javacomplete#server#GetClassPath()

"let g:ale_php_phan_use_client = 1
"let g:ale_php_phan_executable = '/home/mikael/phan/phan_client'

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

autocmd BufEnter,FocusGained,VimEnter,WinEnter *.rs set noexpandtab

"Number of spaces for tab key
autocmd BufEnter,FocusGained,VimEnter,WinEnter *                  set tabstop=4
autocmd BufEnter,FocusGained,VimEnter,WinEnter */origin/*,*/molway/*,*/elastics-backend/*,*.vimrc set tabstop=2

"Number of spaces for tab key
autocmd BufEnter,FocusGained,VimEnter,WinEnter *                  set softtabstop=4
autocmd BufEnter,FocusGained,VimEnter,WinEnter */origin/*,*/molway/*,*/elastics-backend/*,*.vimrc set softtabstop=2

"Number of spaces for autoindent
autocmd BufEnter,FocusGained,VimEnter,WinEnter *                  set shiftwidth=4
autocmd BufEnter,FocusGained,VimEnter,WinEnter */origin/*,*/molway/*,*/elastics-backend/*,*.vimrc set shiftwidth=2

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

autocmd BufWritePost *.snippets :call UltiSnips#RefreshSnippets()

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

"inoremap <c-t> <c-p>
"inoremap <c-n> <c-n>
"xnoremap <c-t> <c-p>


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


nnoremap <leader>t <cmd>Telescope find_files<cr>

vnoremap s :s/\v%V

let php_var_selector_is_identifier=1

filetype plugin on
syntax on

"colorscheme night-owl
"let g:lightline = { 'colorscheme': 'nightowl' }
colorscheme tokyonight
let g:lightline = { 'colorscheme': 'tokyonight' }

set signcolumn=yes

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "c_sharp"},
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = alse,
    },
}

require'lspconfig'.csharp_ls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.eslint.setup{}
require'lspconfig'.rust_analyzer.setup{}

local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

map('n', 'gh', "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>h', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--map('i', '<leader>h', "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
map('n', '<leader>c', ":Telescope lsp_code_actions<CR>", opts)
map('v', '<leader>c', "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
map('n', '<leader>r', "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map('n', '<leader>d', "<cmd>lua vim.diagnostic.open_float({scope=\"line\"})<CR>", opts)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
    }
)

local cmp = require'cmp'

cmp.setup {
    completion = {
        autocomplete = false
    },
    mapping = {
        ["<C-t>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = function()
            if not cmp.visible() then
                cmp.complete()
            end
            cmp.select_next_item()
        end,
        ["<C-e>"] = cmp.mapping.close(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }
    },
    sources = {
        {name = "nvim_lsp"},
        {name = "buffer"},
        {name = "path"},
    }
}

EOF


inoremap {<CR> {<CR>}<Esc>O


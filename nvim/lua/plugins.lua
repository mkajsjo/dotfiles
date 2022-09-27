local execute = vim.api.nvim_command
local vimscript = vim.api.nvim_exec
local fn = vim.fn

install_path = '~/.vim/autoload/plug.vim'

-- Auto install vim-plug if missing
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!curl -fLo ~/.vim/autoload/plug.vim --create-dirs'..
        'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
    vimscript('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

if empty(glob('~/.vim/autoload/plug.vim'))
endif

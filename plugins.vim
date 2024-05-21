" Plugins via nvim
call plug#begin('~/nvim/plugged')

"theme
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }


Plug 'ludovicchabant/vim-gutentags'     " Automatic ctags
Plug 'SirVer/ultisnips'                 " Snippets. Also a dependency of pdv (the way we have it configured)
Plug 'honza/vim-snippets'               " Large snippets library for multiple languages
Plug 'tobyS/vmustache'                  " Templating system (required for pdv)
Plug 'tobyS/pdv'                        " Auto generating php docblocks
"Plug 'vim-airline/vim-airline'          " Vim status line
"Plug 'vim-airline/vim-airline-themes'   " Vim status line themes
Plug 'StanAngeloff/php.vim'             " Improved syntax highlighting for php
Plug 'ncm2/ncm2'                        " Autocompletion engine
Plug 'ncm2/ncm2-bufword'                " Basic word completion? testing
Plug 'roxma/nvim-yarp'                  " Yet Another Remote Plugin Framework (dependency of ncm2)
Plug 'phpactor/phpactor', {'do': 'composer install', 'for': 'php'} " PHP introspection and refactor tools
Plug 'phpactor/ncm2-phpactor'           " Phpactor integration for ncm2 (autocomplete)
Plug 'morhetz/gruvbox'                  " Vim colorscheme
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy file search and more
Plug 'tpope/vim-fugitive'               " Git integration
Plug 'mhinz/vim-signify'                " Git integration inline
Plug 'stephpy/vim-php-cs-fixer'         " Coding standards fixer
Plug 'janko-m/vim-test'                 " Run unit tests
Plug 'tpope/vim-dispatch'               " Dispatch tasks (only using it for unit tests)
Plug 'bling/vim-bufferline'             " Show buffers in status bar
Plug 'w0rp/ale'                         " Asynchronous code linter and anylysis
Plug 'scrooloose/nerdtree'              " File/directory Tree explorer
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
Plug 'dcampos/nvim-sftp-sync', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/formatter.nvim'

" Golang

Plug 'ray-x/go.nvim'
Plug 'crusj/structrue-go.nvim'
Plug 'crispgm/nvim-go'
Plug 'edolphin-ydf/goimpl.nvim'
Plug 'olexsmir/gopher.nvim'
Plug 'rafaelsq/nvim-goc.lua'
Plug 'crusj/hierarchy-tree-go.nvim'
Plug 'yanskun/gotests.nvim'

"PHP

Plug 'gbprod/phpactor.nvim'
Plug 'ta-tikoma/php.easy.nvim'
Plug 'lewis6991/gitsigns.nvim'

"Extra

Plug 'wbthomason/packer.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'chama-chomo/grail'
Plug 'fatih/vim-go'
Plug 'akinsho/toggleterm.nvim'
Plug 'terrortylor/nvim-comment'
Plug 'CreaturePhil/vim-handmade-hero'
Plug 'lambdalisue/fern.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-obsession'
Plug 'bkad/CamelCaseMotion'
Plug 'gcmt/taboo.vim'
Plug 'godlygeek/tabular'
Plug 'mattn/calendar-vim'
Plug 'vim-scripts/utl.vim'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'majutsushi/tagbar'
Plug 'Shougo/neoinclude.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'
Plug 'rhysd/vim-go-impl'
Plug 'nsf/gocode'
Plug 'zchee/deoplete-go'
Plug 'sebdah/vim-delve'
Plug 'warbear0129/vim-qtpl'
Plug 'zchee/deoplete-jedi'
Plug 'fisadev/vim-isort'
Plug 'zchee/deoplete-clang'
Plug 'xaizek/vim-inccomplete'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'abudden/taghighlight-automirror'
Plug 'rust-lang/rust.vim'
Plug '~/.config/nvim/plugged/zsyntax-tweaks'
Plug 'ternjs/tern_for_vim'
Plug 'ramitos/jsctags'
Plug 'pangloss/vim-javascript'
Plug 'roxma/LanguageServer-php-neovim'
Plug 'lvht/phpcd.vim'
Plug 'junegunn/goyo.vim'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'posva/vim-vue'
Plug 'burner/amber.vim'
Plug 'yosssi/vim-ace'
Plug 'cespare/vim-toml'
Plug 'digitaltoad/vim-pug'
Plug 'baskerville/vim-sxhkdrc'
Plug 'dag/vim-fish'
Plug 'exu/pgsql.vim'
Plug 'chrisbra/Colorizer'
"Plug 'ryanoasis/vim-devicons'
Plug 'justthefish/vim-thefish-colors'
Plug 'junegunn/vim-plug'


call plug#end()

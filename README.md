This isn't terribly useful on its own, but it's a fair example of using
pathogen and submodules for managing your vim install.

## Installation

Run the following:

    git clone git://github.com/jonathangeiger/.vim.git vim
    cd vim
    rake install

which will do the following:

 * Update and initialize the included vim bundles
 * Copy the current directory to .vim, backing up any current .vim
   directory you currently have to `.vim + the date and time`
 * Symlink `~/.vimrc` and `~/.gvimrc` to `.vim/vimrc` and `.vim/.gvimrc`
   respectively


# neovim config

i try to use neovim everywhere, and where i do, i also use this config.  
who needs mice anyways...

## requirements

- NeoVim  0.10.0 (or greater)
    - will also work with some older versions of nvim, but some features may break.
    
- many **language servers** need npm to be installed, and grammarly needs cargo. 
    - npm
    - cargo
- also you may need to run the following to allow the installation of other packages:
    - `sudo apt install python3-pip python3-dev python3-setuptools python3.10-venv`

## setup 
clone this repo into `~/.config/nvim/`.  
wait for the syncing to finish. if there are issues, check whether you fulfill the requirements, close and reopen and press `space u a` to update the plugins just in case. quit that window and from withing nvim press `space u m` to install language servers, formatters and linters.
both of these key combinations are used for updating too, so rerun them as you like, especially if there are issues.

## usage

### key mappings
anything written inbetween angled brackets like so `<something>` needs to be pressed simultaneously, like `<C-n>` being ctrl + n.
alternantively it can be a special key in any other way.  
examples:
- `<C>` control
- `<S>` shift
- `<M>` meta
- `<Tab>` tabulator
- `<Esc>` escape
- `<leader>` currently set to space

anything else has to be pressed in the order that it is shown.  
therefore, `<leader> + ua` translates to first pressing space, then u and then a.  
this makes working with vim like replacing a mouse with typing a text. while this may sound horrible to you right now, i can assure you that it's amazing.

if you want to change any mapping or want to get a deeper understanding, they can be found in three places:
- original vim mappings can be found in their docs 
- most custom mappings can me found in `./lua/mappings/`
- some custom mappings are either defaults of the respective plugin, which can be found in their documentation, or set in the respective plugins configuration file in `./lua/configs/`.

### plugins 
if you need any plugin that isn't included, add it in the `./lua/plugins/` directory.  
if any plugin isn't needed or it doesn't work and you just wanna get rid of it quickly, uncomment it in `./lua/plugins/`.

### lsps
if you need a language server, refer to `./lua/configs/lsp.lua` and `./lua/configs/mason-installer.lua`. 
the lspconfig builds the connection between nvim and the respective lsp, while mason ensures that the lsp is installed.  
after adding an lsp to the config and mason, press `<leader> + um` to update with mason, which installs the lsp if possible.  
sometimes an lsp may need an external tool, like pyright needing npm to install.

rust is an exception. it has to be handled differently. installing that is on the roadmap. 

### external programs
telescope is an amazing fuzzy finder plugin that requires ripgrep to be installed.

lazygit is an external program that brings a tui for git to not only the commandline, but also nvim. if installed, it can be opened with `<leader> + gg` and left with `q`.

### theming
this repo is built around using catppuccin.

## future ideas
repl via [vim-slime](https://github.com/jpalardy/vim-slime) or iron.nvim

## FAQ:

Q: is it any good?  
A: yes

## thanks to
- [github nvim-kickstart-python](https://github.com/chrisgrieser/nvim-kickstart-python/tree/main)
- [reddit nvim-kickstart-python](https://www.reddit.com/r/neovim/comments/16p7um2/introducing_nvimkickstartpython_a_starter_config/)

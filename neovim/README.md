## Neovim configuration

#### Clone repository inside configuration
```
git clone https://github.com/jponferrada26/dotnvim ~/.config/nvim
```
#### Autoload config
```
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
#### Install plugins
1. Run nvim
2. Run :PlugInstall
3. Restart nvim for apply changes

### Points to note
* since the `ryanoasis/vim-devicons` plugin is used for icon management and it requires these [fonts](https://github.com/ryanoasis/nerd-fonts), it is advised to use `MesloLGM`.

### Requirements
* have `node` or `python` for the `coc` plugin utilities.

# My LazyVim configuration

Configuration user for [LazyVim](https://www.lazyvim.org/)

## 🛠️ Install

#### Clone the repository

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.
Clone repository in temporal folder

```shell
git clone git clone https://github.com/jponferrada26/dotnvim /tmp/dotnvim
```

#### Backup old nvim configuration

```shell
mv ~/.config/nvim ~/.config/nvim.bak

```

#### Remove temporal files (Recommended)

```shell
mv ~/.local/share/nvim
mv ~/.local/state/nvim
mv ~/.cache/nvim
```

#### Extract LazyNvim configuration and move to your nvim

```shell
cp -r /tmp/dotnvim/lazyvim ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

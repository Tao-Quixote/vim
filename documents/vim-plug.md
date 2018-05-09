# vim-plug

Vim 本身的功能很强大，但是如果引入一些插件的话，在某些情况下会变得更加强大和便捷。在 GitHub 上有很多 Vim 的插件；插件多了，如何安装和管理插件便成了一个问题。如果手动安装和删除 Vim 插件，需要深入 Vim 的配置路径增加和删除文件，比较笨拙。

作者这里选择使用 [vim-plug](https://github.com/junegunn/vim-plug) 来管理 Vim 插件，因为其比较轻量级、设置简单、速度快、按需加载等特性足以满足作者现在的需要。

## 安装

### vim

```vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Neovim

```vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## 配置

vim-plug 的配置写在 vim(`~/.vimrc`) 或者 Neovim(`~/.config/nvim/init.vim`) 的配置文件中，不需要额外的配置文件。打开上述配置文件：

* vim-plug 的配置模块以 `call plug#begin()` 开头
* 使用 `Plug` 命令标示要管理的插件
* 以 `call plug#end()` 作为 vim-plug 配置模块的结尾

`call plug#begin()` 和 `call plug#end()` 之间的部分都认为是 vim-plug 的配置，与 vim-plug 无关的配置应该写在这两条语句之外的部分。

### 示例

```vim
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
```

示例来自 [GitHub README](https://github.com/junegunn/vim-plug#example) 部分。从上面的示例可以知道，vim-plug 支持多种插件地址配置方式以及按需加载、插件版本等配置。

## 命令

vim-plug 通过命令的方式来管理插件。当我们在 `~/.vimrc` 中配置好要管理的插件后，剩下的事情就交给命令了。命令的使用方式同 Vim 自身的命令，在命令模式下输入 `:cmd` 来执行命令。

* `PlugInstall [name ...] [#threads]` 安装插件
* `PlugUpdate [name ...] [#threads]` 安装/更新插件
* `PlugUpgrade` 更新 vim-plug 自身
* `PlugClean[!]` 清理插件目录下没有配置在 `~/.vimrc` 中的插件目录
* `PlugStatus` 展示插件的状态
* `PlugDiff` 展示插件更新前后的区别
* `PlugSnapshot` 生成当前插件的快照

## 自动安装

可以在 `call plug#begin()` 之前加上下面这段 VimScript，这样如果当前机器没有安装 vim-plug，会自动下载安装 vim-plug，然后再执行后面的操作：

```vim
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
```

## 参考链接

* [junegunn/vim-plug](https://github.com/junegunn/vim-plug)

## Author Info 🐺

* [GitHub](https://github.com/Tao-Quixote)
* e-mail：<web.taox@gmail.com>
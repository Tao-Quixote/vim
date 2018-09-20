# netrw

在使用 Vim 时，我们经常会安装 [NERDTree](../plugin/nerdtree.md) 插件来模仿其他编辑器中的目录树；最近在安装了不少插件之后感觉 Vim 在运行时有卡顿的感觉，在想着给 Vim 做减法，减少不必要的插件，使用原生的功能来实现插件的功能。

Vim 在发型版本中内置了一个插件：netrw，该插件提供了在 Vim 中管理文件系统的功能，且其在配置之后，完全可以媲美 NERDTree 提供的目录管理功能。

注意，每一个被编辑的文件在 Vim 都会被当成一个 buffer 来处理；同样的，netrw 打开的文件浏览也被当成是一个 buffer，同样可以在任意一个分割的窗口中展示、操作；对 netrw buffer 的移动操作同普通文件的普通模式中一致。

## 准备

netrw 并不是 Vim 核心源码实现的，而是由插件实现的，所以我们要在 `.vimrc` 中配置允许加载插件：

```viml
set nocompatible
filetype plugin on
```

## commands

| lazy | mnemonic | open file explorer
--------------------------------------
| :e. | :edit . | 打开当前工作目录 |
| :sp. | :split . | 在水平分割窗口中打开当前工作目录 |
| :vs. | :vsplit . | 在垂直分割窗口中打开当前工作目录 |
| :E | :Explore | 打开当前缓冲区对应文件所在的目录 |
| :Se | :Sexplore | 在分割窗口中打开当前缓冲区对应文件所在的目录 |
| :Ve | :Vexplore | 在垂直分割窗口中打开当前缓冲区对应文件所在的目录 |

## 操作按键

* % - 创建新文件
* d - 创建新目录
* D - 尝试删除文件/目录
* gh - 快速 隐藏/展示 `.` 开头的隐藏文件
* R - 重命名
* I - 隐藏信息栏
* i - 修改目录树的展示方式
* s - 修改排序方式
* `<C-l>` - 刷新目录树列表

## 打开文件

* o - 在水平分割窗口中打开文件
* t - 在新 tab 中打开文件
* v - 在垂直分割的窗口中打开文件

## 将 netrw 设置为 NERDTree 样式

在 Vim 中，我们可以通过下面的设置将 netrw 设置为 NERDTree 的样式和行为：

```viml
let g:netrw_banner = 0 " 隐藏 banner
let g:netrw_liststyle = 3 " 设置目录树展示样式
let g:netrw_browse_split = 4 " 设置打开文件的默认方式
let g:netrw_altv = 1 " 设置 right/left 分割
let g:netrw_winsize = 25 " 设置 netrw 目录树的宽度百分比
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore 
augroup END
```

这里只是使用 netrw 模仿 NERDTree 的样子，但是并不是 netrw 本来应该使用的方式，所以建议按照其应该的方式去使用 netrw，而不是非要去模仿 GUI 中的目录树管理方式。所以作者使用了下面的比较简单的配置：

```viml
let g:netrw_banner = 0 " 隐藏 banner
let g:netrw_liststyle = 3 " 设置目录树展示样式
map <leader>g :Vexplore<CR>
```

## 参考

* [The file explorer](http://vimcasts.org/episodes/the-file-explorer/)
* [Vim: you don't need NERDtree or (maybe) netrw](https://shapeshed.com/vim-netrw/#netrw-the-unloved-directory-browser)
* [Magic of netrw in Vim 🎩💥](http://kgrz.io/editing-files-over-network.html)

## Author 🦍

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

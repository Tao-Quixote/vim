# 常见问题

## 语法高亮失效的问题

在使用 Vim 编辑大文件的时候，经常会出现语法高亮失效的问题，该问题多出现在使用 `<Ctrl-D>` `<Ctrl-F>` `G` 或者 `:linenum` 进行跳转时。[Vim 官方仓库issue 链接 - syntax highlighting breaks for big file after jump or search #2790](https://github.com/vim/vim/issues/2790)。

初步尝试，使用 `:syntax sync fromstart` 命令可以重置重启语法高亮。

## Author 🐑

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

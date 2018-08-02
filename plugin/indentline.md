# indenetline

在开发时有时会用到使用缩进来表示代码快的语言，比如 Python、Pug、Stylus 等，而 Vim 不提供缩进线来标示代码的缩进，所以在编辑靠缩进来标示代码块的开发语言时会比较痛苦。今天介绍的这个插件就是用来在 Vim 中提供缩进线标示功能的。

## 要求

该插件依赖 Vim7.3 提供的 `conceal` 功能，所以 Vim7.3 之前的版本不能使用该插件。

## 安装

推荐使用 [vim-plug](./vim-plug.md) 安装。

## 自定义

想要自定义 indentline 插件，在 `.vimrc` 文件中添加下面的配置：

### 修改字符颜色

indentline 默认会重写 conceal 颜色，如果想要使用自己的颜色主题来高亮 conceal 的颜色，使用下面的配置来禁用 indentline 的默认重写行为：

```viml
let g:indentLine_setColors = 0
```

### 自定义 conceal 颜色

```viml
" Vim
let g:indentLine_color_term = 239

" GVim
let g:indentLine_color_gui = '#A4E57E'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
let g:indentLine_bgcolor_gui = '#FF5F00'
```

### 自定义缩进字符

```viml
let g:indentLine_char = 'c'
```

这里的 `c` 可以是任意的 ASCII 字符。也可以使用 `¦` `┆` `│` `⎸` 或者 `▏` 作为缩进标示线。**注：这些符号只能在 UTF-8 编码的文件中有效**

## 命令

`:IndentLinesToggle` 用来切换是否展示缩进标示线。

## 仓库地址

[indexline](https://github.com/Yggdroot/indentLine)

## Author 🐠

* [GitHub](https://github.com/Tao-Quixote)
* Email: <web.taox@gmial.com>

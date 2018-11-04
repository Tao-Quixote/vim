# view & session

这里的 view 和 session，通俗地说就是“快照”，这个概念类似于 Linux 中的快照，只不过保存的配置信息不同。

> A View is a collection of settings that apply to one window.  You can save a View and when you restore it later, the text is displayed in the same way.  The options and mappings in this window will also be restored, so that you can continue editing like when the View was saved.

view 是 Vim 中最小的快照单位，一个 view 保存一个窗口的配置、按键映射等信息；

> A Session keeps the Views for all windows, plus the global settings.  You can save a Session and when you restore it later the window layout looks the same.  You can use a Session to quickly switch between different projects, automatically loading the files you were last working on in that project.

session 是 view 的集合，一个 session 快照可以同时保存多个 view 集合的信息。

`:mkview` 命令只作用于当前窗口，保存当前窗口的相关信息；`:mksession` 用来存储所有窗口的设置以及全局设置。

**注意**：这些特性在 Vi 中是不存在的，且如果通过源码编译时没有 `+mksession` 特性，在 Vim 中也不可使用。

## command

* `:mks[esssion][!] [filename]` - 创建一个保存当前会话的 Vim 脚本。如果使用了 `[!]`，如果 `[filename]` 存在时会被新的文件强制覆盖；如果没有指定文件名的话，则默认使用 `Session.vim` 作为快照的文件名
* `:source [filename]` - 载入指定的 session.vim 文件
* `:mkvie[w][!] [filename]` - 行为同 `:mksession`，只不过用来保存当前窗口的快照
* `:lo[adview] [nr]` - 载入当前窗口的快照。

## 使用方式

```viml
:mksession[!] {filename} " 将快照信息保存到 {filename} 文件中
:source {filename} " 载入 {filename} 指定的快照
```

如上面的例子所示，在 Vim 中，通过 `:mksession` 命令创建快照保存 Vim 当前的状态；通过 `:source` 命令加载快照重现保存之前的状态。

在快照配置文件被加载之后，全局变量 SessionLoad 会被设置为 1。

## 缺点

* 快照不会重载所有内容，例如，定义的 function、autocommand 和 `:syntax on` 这些不被包括。寄存器的内容以及命令行历史保存在 viminfo 中而不是快照中
* 全局选项的值只有在与默认值不相同时才会被重新载入；
* 覆盖已经的存在的按键映射时没有警告
* Vim script 的效率不是特别高（但还是比手动输入要高）

## 查看帮助文档

* `:h views-sessions` - 查看 view 和 session 的详细文档

## Author Info 🐇

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

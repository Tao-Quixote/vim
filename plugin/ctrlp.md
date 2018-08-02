# ctrlp.vim

在开发中，有时会用到模糊路径匹配来打开文件，今天的这个插件 ctrlp.vim 就是用来做完整路径模糊匹配的。支持 文件、buffer、MRU、tag 等的模糊匹配查询。

## 基本用法

MRU: Most Recently Used - 最常用的

### 启动 ctrlp

* 在命令模式中运行 `:CtrlP` 或者  `:CtrlP [starting-directory]` 来启动文件查找模式
* 在命令模式中运行 `:CtrlPBuffer` 或者  `:CtrlPMRU` 来启动 buffer 查找模式或者 MRU 文件查找模式
* 在命令模式中运行 `:CtrlPMixed` 来启动混合查找模式，该模式同时包括文件、buffer 和 MRU 文件查找模式

### key mappings

**注：这里的映射只能在 ctrlp 启动的时候使用。**

* `<F5>` - 清除当前目录的缓存，更新新增/删除/忽略的文件
* `<c-f>` / `<c-b>` - 在查找方式之间切换
* `<c-d>` - 切换到单纯的文件名匹配，不再是全路径匹配
* `<c-r>` - 切换到正则模式
* `<c-j>` / `<c-k>` - 上下移动
* `<c-t>` / `<c-v>` / `<c-x>` - 在新的 tab/vsplit/split 中打开文件
* `<c-n>` / `<c-p>` - 在历史记录中选择下一个/上一个查找字符串
* `<c-y>` - 新建文件及其父目录
* `<c-z>` - 标记多个文件，标记的多个文件可以使用 `<c-o>` 一起打开

可以使用 `:help ctrlp-mappings` 来查看更多映射。

### 基本选项

* 修改启动 ctrlp 的默认映射和快捷键

```viml
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
```

* 如果启动时没有指定起始目录，CtrlP 会根据下面的变量设置本地工作目录：
    * `c` - 当前文件所在的目录
    * `a` - 当前文件所在的目录，除非该目录是 cwd 的子目录
    * `r` - 离包含 `.git`, `.ht`, `.svn`, `.bzr`, `_darcs` 目录最近的父目录

```viml
let g:ctrlp_working_path_mode = 'ra'
```

* 如果一个文件已经打开了，重新打开一个而不是跳转到已经打开的buffer

```viml
let g:ctrlp_switch_buffer = 'et'
```

* 忽略 `.gitignore` 中的文件

```viml
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
```

更多选项请通过 `:help ctrlp-options` 命令查看。

## Repo 地址

[ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)

## Author 🐡

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

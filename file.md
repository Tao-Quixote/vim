# 文件操作

## 缓冲区标识

* `%` - 哪个缓冲区在当前窗口中可见
* `#` - 轮换文件

## cmd

### buffer

* `:ls` - 展示所有缓冲区
* `:buffer N` - 跳转到第 N 个buffer并打开
* `:bnext` - 跳转展示下一个缓冲区
* `:bprev` - 跳转展示上一个缓冲区
* `:bfirst` - 跳转展示最后一个缓冲区
* `:blast` - 跳转展示第一个缓冲区
* `:edit!` - 如果一个缓冲区没有保存就切换了，可以使用该命令读取磁盘内容覆盖缓冲区内容；如果想要保存内容，使用 `:write` 保存退出
* `:qa[ll]!` - 关闭所有窗口，丢弃未保存的修改
* `:wa[ll]!` - 将所有缓冲区的内容写入磁盘

### args

* `:args {arglist}` - 填充参数列表
* `:next` - 展示下一个参数表示的文件
* `:previous` - 展示上一个参数表示的文件

## shortkeys

* `<C-^>` - 展示下一个轮换缓冲区
* `<C-g>` - 展示当前文件的状态信息

## 窗口

### open window

* `<C-w>v` - 垂直分割窗口
* `<C-w>s` - 水平分割窗口

### close window

* `:clo[se]` - `<C-w>c` - 关闭当前活动窗口
* `:on[ly]` - `<C-w>o` - 只保留活动窗口，关闭其他所有窗口

### resize window

* `<C-w>=` - 使所有窗口等高、等宽
* `<C-w>_` - 使活动窗口高度最大
* `<C-w>|` - 使活动窗口宽度最大
* `[N]<C-w>_` - 使活动窗口的高度为 [N] 行
* `[N]<C-w>|` - 使活动窗口的宽度为 [N] 列

## tab

### open & close

* `tabe[dit] {filename}` - 在新标签页中打开文件 {filename}
* `<C-w>T` - 把当前窗口移到一个新标签页
* `:tabc[lose]` - 关闭当前标签页及其中所有窗口
* `:tabo[nly]` - 只保留活动标签页，关闭其他所有标签页

### switch

* `:tabn[ext] {N}` - `{N}gt` - 跳转到第 N 个标签页
* `:tabn[ext]` - `gt` - 跳转到下一个标签页
* `:tabp[revious]` - `gT` - 跳转到上一个标签页

## open & save file

* `:edit %<Tab>` - % 代表活动缓冲区的完整文件路径
* `:edit %:h<Tab>` - % 代表活动缓冲区的完整文件路径，`:h` 会去除文件名，只剩下工作路径，可用于打开同级目录下的文件

### 使用 find 进行模糊路径匹配

可以通过使用上面的 `:edit` 命令 + 完整路径来打开一个文件，但是如果想打开的文件嵌套在更深的目录中时，可以通过使用 `:find` 命令 + `{filename}` 来进行模糊匹配，首先要设置 `path`，然后就可以使用 `:find` 命令和 Tab 补全一起使用了：

* `:set path+=app/**` - 在使用之前需要先设置 find 查找文件的路径
* `:find nav<Tab>` - 然后使用 `:find` + Tab 补全即可

### 保存不存在的文件

如果创建了一个不存在目录中的文件，可以使用下面的方式来保存到磁盘：

```viml
:!mkdir -p %:h " 创建当前缓冲区文件的存放目录
:w[rite] " 保存缓冲区内容到磁盘
```

## netrw

* `:edit %:h` - 在文件管理器中打开当前文件所在的目录
* `:Explore` - `:E` - netrw 提供的 cmd，同 `:edit %:h`，在当前活动窗口中打开文件管理器，并显示活动缓冲区所在的目录
* `:Sexplore` - 在一个水平切分窗口里打开文件管理器
* `:Vexplore` - 在一个垂直切分窗口里打开文件管理器
* `<C-^>` - 用于在打开文件管理器后跳转回原来的文件

## Author 🦓

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

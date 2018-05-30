# cheatsheets

## 返回普通模式

* `esc` - 从其他模式返回普通模式
* `Ctrl + [` - 同 `esc`，但是更顺手

## 路径信息（path）

* `Ctrl + G` - 显示文件路径信息 & cursor 在文件中位置的信息

## 跳转（jump）

* `Ctrl + O` - 跳转到光标之前所在的位置
* `Ctrl + I` - 跳转到光标之后所在的位置
* `%` - 跳转到跟光标所在括号(`()``[]``{}`)匹配的括号

## 替换（substitute）

* `:#,#s/old/new/g` - `#,#` 表示行号，在行号指定的范围内替换
* `:%s/old/new/g` - 全局替换
* `:%s/old/new/gc` - 全局替换，但是会弹框提示询问是否替换
* `R` - 进入替换模式，从光标所在字符一直向后替换，知道按 esc 键返回普通模式

## 缩进 & 格式化

* `=` - 格式化当前行
* `>>` - 向右缩进一格
* `<<` - 向左缩进一格

### 组合

* `gg=G` - 整个文件格式化
* `2,5>` - 第二到第五行向右缩进一个空格
* `2,5<` - 第二到第五行向左缩进一个空格

## 命令（command）

* `:! + cmd` - 执行外部命令，这里的 `cmd` 指在 shell 中可以运行的命令；可以执行任意外部指令，也允许带参数

## 提取合并文件

* `:r filename` - 将 filename 文件的内容插入到光标所在行的下面
* `:r !ls` - 将 ls 命令的结果插入到光标所在行的下面

## options

* `hls`/`hlsearch` - 高亮搜索匹配项
* `is`/`incsearch` - 显示部分匹配
* `ic`/`ignorecase` - 忽略大小写

**关闭该 option 只需要在 option 之前加上 `no`。**

## tips

本文只是记录作者自己不太熟悉但是感觉会用到的快捷键，并不是比较完善的 cheatsheets；如果想看比较完备的 cheatsheets，请移步 **韦易笑** 整理的 **[awsome-cheetsheets](https://github.com/skywind3000/awesome-cheatsheets/blob/master/editors/vim.txt)**。

# Author Info 🦂

* [GitHub](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>
# substitute

缺省情况下 substitute 命令只会替换第一个匹配的位置，要想修改所有的匹配，需要使用特殊标志位 `g`。

## 替换的完整模式

```viml
:[range]s[ubstitute]/{pattern}/{string}/[flags]
```

* `[range]` - substitute 命令的范围
* `{pattern}` - 匹配模式，参见 [pattern](./pattern.md)
* `{string}` - 用来替换匹配内容的字符串
* `[flags]` - 标志位，用来约束 substitute 命令的行为

## flags

* `g` - 使 substitute 命令作用于匹配到的所有内容
* `c` - 在替换之前先确认是否替换
* `n` - 不执行替换，只统计 substitute 命令匹配到的个数
* `&` - 告诉 substitute 命令使用上次的标志位
* `e` - 用来屏蔽未查找到时的报错

## 标志位 c

当我们想逐一查看匹配选项然后决定是否替换时，可以使用 c 标志位来实现。当匹配到内容时，Vim 会提醒是否替换，提示：

```viml
replace with [content] (y/n/a/q/l/^E/^Y)?
```

提示是否使用 `[content]` 来替换匹配到的内容，这里的 `[content]` 即为上面的 `{string}`。提示信息的意义如下：

* y - 替换此处的匹配
* n - 跳过此处匹配
* a - all，替换此处及之后的所有匹配
* q - 退出替换过程
* l - last，替换此处匹配后退出
* `<C-e>` - 向上滚动内容
* `<C-y>` - 向下滚动内容

## 重复上一次替换（substitute 命令）

当执行过一次 `:substitute` 命令之后，可以通过下面几种方式重复执行上一次替换动作：

* `:[range]s[bustitute] [flags] [count]` or `:[range]&[&][flags] [count]` - 重复上一次 substitute 命令，使用同上次相同的模式和替换字符串，但是上次替换动作的标志位会被重置，需要手动指定。
* `:[range]~[&][flags] [count]` - 重复上次替换动作，使用相同的替换字符串，但是使用上一次查找的模式作为替换匹配的模式，同 `:[range]s//~/[&][flags] [count]`
* `:s//~/&` - 使用上一次匹配模式，上一次 substitute 的替换字符串以及上一次替换动作的标志位来执行替换动作
* `:&&` - 拆解为两个部分，`:&` 部分用来表示重复上次的 substitute 动作，但是该命令会重置标志位，所以，`&` 用来表示使用上次替换动作的标志位。
* `g&` - `:%s//~/&` 的同义词，表示将上一次的替换动作使用在所有行上，保持上一次替换动作的所有信息，但是修改行作用范围

## 在 substitute 命令中使用寄存器的内容

替换字符串可以不手动输入，而是使用寄存器中的内容来作为替换字符串。可以使用下面两种方式使用寄存器中的内容，这里假设使用的寄存器为 `a`:

```viml
:s/baz/<C-r>a/g
```

上面这种方式利用了 `<C-r>` 快捷键，用来在光标位置输入指定寄存器的内容；

```viml
:s/baz/\=@a/g
```

上面这种方式利用了 `\=` 符号，该符号会告诉 Vim 其之后的内容是一段 VimScript，Vim 会将其后的内容作为 VimScript 来解析执行；`@a` 用来表示引用寄存器 `a` 中的内容。

寄存器中的内容可以手动输入，也可以直接在当前 buffer 中复制：

```viml
:let @a = 3
"ayiw
```

上面两种方式都可以给寄存器 `a` 赋值。

## 使用表达式作为替换字符串

在 `:s///` 的替换字符串部分可以使用 Vim 脚本中的表达式、内置函数等，使用其结果作为替换字符串。这里使用表达式的方式需要在其前加 `\=`，这两个符号的组合会告诉 Vim，其后为 Vim 脚本，计算其结果作为替换字符串。例，给当前文件的所有行加上行号：

```viml
:%s/^/\=line('.')."\t"/
```

上面的替换字符串部分使用了内置函数 `line()`，详细使用方式可以通过 `:h line()` 命令查看；其他可以使用的求值表达式、内置函数等，可以通过 `:h eval.txt` 命令查看帮助文档。

## 对多个文件执行查找/替换操作

### 方法1: 使用 `:argdo`

```viml
:args **/*.txt " 使用 :args 批量打开要替换的文件
:set hidden " 该选项允许不保存跳转到其他文件
:argdo %s/re/substring/ge " 遍历参数列表执行查找替换，e 标志位用于省略错误，没有匹配项的文件在执行替换时会报错
```

### 方法2：使用 `:vimgrep` 过滤，只对包含匹配项的文件执行替换

上面的方法会对参数列表中的所有文件执行查找&替换，其实我们要做的应该是只对包含匹配项的文件执行替换操作，所以这里使用 `:vimgrep` 先对项目文件进行筛选，然后对筛选后的文件执行替换操作。`:vimgrep /re/ {files}` 的结果会保存在 quickfix 列表中，我们需要使用 `:argdo` 对 quickfix 列表进行遍历，但是 Vim 原生并不支持这个特性，所以可以通过手动设置一个命令用来将 quickfix 列表中的文件添加到 `:args` 的参数列表中：

```viml
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
  function! QuickfixFilenames()
     let buffer_numbers = {}
     for quickfix_item in getqflist()
let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr']
)
endfor
return join(map(values(buffer_numbers), 'fnameescape(v:val)')) endfunction
```

上面的 Vim 脚本定义了一个新的命令 `:Qargs`，该命令会将 quickfix 列表中的文件添加到 args 的参数列表中，然后：

```viml
:vimgrep /re/ **/*.txt " 查找包含匹配选项的文件
:Qargs " 将 quickfix 列表的内容添加到 args 的参数列表中
:argdo %s/re/substring/g " 这里只对包含匹配项的文件进行操作，所以不需要 e 标志位
:argdo update " :update 命令用于保存修改过的文件，未修改的文件不会保存
```

`:update` 命令的帮助文档可以通过 `:h update` 查看。

## 链接

* [Using an expression in substitute command](http://vim.wikia.com/wiki/Using_an_expression_in_substitute_command)

## Author 🐕

* [GitHub](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

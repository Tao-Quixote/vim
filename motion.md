# motion

## disable arrowkeys

在使用 Vim 时，不建议使用光标键对光标进行移动；可以通过下面的配置禁用光标键：

```viml
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
```

## 屏幕行与实际行

> 与许多文本编辑器不同，Vim 会区分实际行与屏幕行。当 ‘wrap’ 设置被启用时 (缺省启用)，每个超出窗口宽度的文本行都会被回绕显示，以保证没有文本显示不出来。这样一来，文件中的一行也许会被显示为屏幕上的若干行。

> This option changes how text is displayed. When on, lines longer than the width of the window will wrap and displaying continues on the next line. When off lines will not wrap and only part of long lines will be displayed. When the cursor is moved to a part that is not shown, the screen will scroll horizontally.

### \{motion\}
* j - 向下移动一个实际行
* gj - 向下移动一个屏幕行
* k - 向上移动一个实际行
* gk - 向上移动一个屏幕行
* 0 - 移动到实际行的行首
* g0 - 移动到屏幕行的行首
* ^ - 移动到实际行的第一个非空白字符
* g^ - 移动到屏幕行的第一个非空白字符
* $ - 移动到实际行的行尾
* g$ - 移动到屏幕行的行尾

### 映射

如果想让 `j` `k` 移动的是屏幕行而不是实际行的话，可以使用下面的配置进行按键映射：

```vim
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
```

## 使用查找进行移动

### f\{char\}

* `f{char}` - 从当前位置往后查找第一个 `{char}`
* `f{char}` - 从当前位置往前查找第一个 `{char}`
* `t{char}` - 从当前位置往后查找第一个 `{char}`，光标停留在 `{char}` 之后的字符上
* `T{char}` - 从当前位置往前查找第一个 `{char}`，光标停留在 `{char}` 之前的字符上

可以通过下面的按键进行重复查找：

* `;` - 重复上一次字符查找
* `,` - 反向重复上一次字符查找

### 单词查找

可以通过命令模式查找完整的单词、句子：

```viml
/word
```

上面的查找命令会在当前文档中查找第一个匹配 word 的字符串，然后停留在 word 的第一个字符上。

* `/` - 向后查找
* `?` - 向前查找
* n - 继续向后查找
* N - 继续向前查找

## 在匹配的括号之间跳转

* `%` - 会在开/闭括号之间跳转，包括 `{}` `[]` `()`

## 位置标记

在 Vim 中，允许通过 `m{a-zA-Z}` 这种方式来设置一个标记，然后可以通过按键 `\`{a-zA-Z` 跳回原来的位置标记点。

小写标记只在当前缓冲区中可见，大写标记在全局作用域中可见。

同时，Vim 会自动设置一些位置标记：

* \`` - 当前文件中上次跳转动作之前的位置
* \`. - 上次修改的地方
* \`^ - 上次插入的地方
* \`< - 上次高亮选区的起始位置
* \`> - 上次高亮选区的结束位置
* \`[ - 上次修改或复制的起始位置
* \`] - 上次修改或复制的结束位置

## Author 🦍

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

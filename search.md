# 查找

## options

* `wrapscan` - 用于设置查找到 buffer 开头/结尾 时的行为，例：如果向后查找到结尾时，会跳转到 buffer 开头继续查找；如果关闭，则查找到结尾时不会跳转到开头进行查找
* `highlight` - 用于高亮匹配查找规则命中的字符

## 关闭高亮

可以通过 `highlight` 来高亮匹配规则命中的结果。也可以通过 `:set nohlsearch` 来永久关闭高亮，但是这样做的话，后续所有的命中都不会高亮；另外一种关闭高亮的方式是通过 `:nohlsearch` 命令，该命令同其他 EX 命令一样是作为命令存在的，而不是 options。此命令使得高亮功能一直处于关闭状态，直到执行新的或 重复的查找命令为止。

## 在查找过程中高亮匹配

在 Vim 中执行查找时，只有在按了 `<CR>` 之后才会在当前 buffer 中执行匹配查找；有时候我们希望可以像其他编辑器一样，在输入匹配规则的过程中就开始查找高亮匹配项，这时可以通过 `:se[t] incsearch` 选项来开启该功能。

在开启了查找预览功能后，可以通过快捷键 `<C-r><C-w>` 组合将预览中的匹配字符填充在查找输入域中；但是该功能有个缺陷，如果在匹配规则中使用了 `\v` 时，不是将预览匹配项中剩余的部分插入输入区域，而是整个单词都拼接在输入域之后。

PS. 不了解 `\v` 功能的可以查看 [patter - 匹配模式](./pattern.md)。

## 统计匹配个数

```viml
:%s///gn
```

上面的命令可以对匹配个数进行统计，并展示在命令行位置。这里使用的就是 `n` 这个标志位，该标志位会告诉 Vim 不要进行替换，而是简单地进行统计。

## 将光标移动到匹配的末尾

如果匹配规则命中了一段字符的话，光标会停留在命中字符部分的第一个字符上；

```viml
This is a paragraph.
/paragra
```

上面的匹配规则会匹配到 `paragraph` 中前面的部分，并且光标会停留在第一个 `p` 字母上， 可以通过下面的方式将光标停留在命中字符的最后一个字符上：

```viml
/paragra/e
```

这样的话，在匹配时，光标会停留在 `paragraph` 单词的最后一个 `a` 字母上。

## 查找可视模式中选中的文本

在可视模式中，`*` `#` 的功能也不是用来查找选中的文本，还是保持原来的功能，即查找当前光标所在的单词；Vim 中没有提供查找选中文本的功能，但是该功能可以通过 VimScript 来手动实现。下面是一段比较完美的实现：

```viml
" vsearch.vim
" Visual mode search
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  " Use this line instead of the above to match matches spanning across lines
  "let @/ = '\V' . substitute(escape(@@, '\'), '\_s\+', '\\_s\\+', 'g')
  call histadd('/', substitute(@/, '[?/]', '\="\\%d".char2nr(submatch(0))', 'g'))
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>/<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>?<CR>
```

上面的这段代码来自 [godlygeek/vim-files](https://github.com/godlygeek/vim-files/blob/master/plugin/vsearch.vim)。除了这段代码之外，有些插件也实现了查找选中文本的功能，例如 [bronson/vim-visual-star-search](https://github.com/bronson/vim-visual-star-search)。

## Author 🦌

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

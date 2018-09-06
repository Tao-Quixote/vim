# command-cheatsheets for scrolling

* 向下滚动：使屏幕下面不可见的内容向上，展示在屏幕中；使屏幕最上的内容超出屏幕消失不见；向下的意思为光标向下；
* 向上滚动：使屏幕上面不可见的内容滚动到视野中；向上的意思为光标向上

## 向下滚动(scrolling downwards)

* `[count]<Ctrl-E>` - 使内容向上移动 `[count]` 行，默认移动一行
* `[count]<Ctrl-D>` - 使光标向下移动 `[count]` 行；如果没有 `[count]`，则默认使用 `scroll` 选项的值，该选项的默认值为半屏，即屏幕总行数的一半
* `[count]<Ctrl-F>` - 使内容向上移动 `[count]` 页，每一屏幕算是一页
* `[count]z+` - 无 `[count]` 时，将屏幕下未展示的第一非空白行在屏幕最上方作为第一行渲染；包含 `[count]` 时，同 `z<CR>`，将光标所在行作为该页的第一行渲染在屏幕最上方

## 向上滚动(scrolling upwards)

* `[count]<C-Y>` - 同 `<C-E>`，方向相反
* `[count]<C-U>` - 同 `<C-D>`，方向相反
* `[count]<C-B>` - 同 `<C-F>`，方向相反
* `[count]z^` - 同 `z+`，方向相反

## 相对光标移动

* `[count]z<CR>` - 将 `[count]` 指定的行作为窗口的第一行进行重绘；光标会重置在第一个非空格的字符所在的列
* `zt` - 同 `z<CR>`，只不过会保持光标所在列的位置
* `z{height}<CR>` - 将当前窗口的高度调整为 `{height}` 所指定的值，不会超过物理屏幕的高度
* `[count]z.` - 将 `[count]` 指定的行在屏幕中间重绘，光标会被重置在第一个非空字符所在的列
* `zz` - 同 `z.`，不会重置光标所在列的位置
* `[count]z-` - 将 `[count]` 指定的行作为屏幕的最后一行进行重绘，且会重置光标的列位置，放置在第一个非空字符所在的列
* `zb` - 同 `z-`，但是不会重置光标的位置

## Author 🐫

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

# vim-commentary

今天介绍一个注释代码的 Vim 插件。

## 安装

推荐使用 [vim-plug](./vim-plug.md) 管理该插件。

## key mappings

* `gc{motion}` - 注释/取消注释 {motion} 经过的行
* `[count]gcc` - 注释/取消注释 [count] 行
* `{Visual}gc` - 注释/取消注释高亮的行
* `gc{text-object}` - 注释/取消注释文本对象指定的行
* `gcgc` - 注释/取消注释当前行
* `gcu` - 取消注释当前行

## commands

* `:[range]Commentary` - 注释/取消注释 [rang] 标示的行

## 扩展默认支持文件类型注释

如果 vim-commentary 默认不支持当前使用的文件时，可以通过 `autocmd` 来新增支持的文件类型注释。可以在 `.vimrc` 中添加如下的检测代码：

```viml
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  autocmd FileType apache setlocal commentstring=#\ %s
endif
```

## Repo

[vim-commentary](https://github.com/tpope/vim-commentary).

## 扩展

除了插件之外，我们还可以借助可视模式中的列块可视模式(-- VISUAL BLOCK --) 来手动添加自己想要的注释，例如，我们想给下面的 JavaScript 代码添加注释：

```javascript
function foo () {
  function bar () {
    console.log('func bar')
  }

  return bar
}
```

我们可以执行如下操作：

* `gg` - 移动光标到首行
* `0` - 移动光标到行首
* `<C-v>` - 进入列块可视模式
* `G` - 移动到末尾行，即选中所有行的第一个字符
* `I` - 进入插入模式
* `// ` - 输入注释符号和一个空格
* `ESC` - 退出可视模式

这时你会发现所有选中行的行首都加上了 `// `，也就完成了注释功能。

同理，也可以通过列块可视模式进行多行的批量操作。

## Author 🐟

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

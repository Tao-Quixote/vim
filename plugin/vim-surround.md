# vim-surround

该插件会需要部分 **文本对象(text object)** 相关的知识点，所以不了解文本对象的可以看一下 [Vim Text Objects: The Definitive Guide](https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/) 这篇文章。

vim-surround 插件主要用于操作包裹文本对象的“包裹”，这些包裹包括：圆括号、花括号、引号、XML标签等。该插件提供了方便增/删/修改这些“包裹”的按键映射。

## install

推荐使用 vim-plug 插件来管理 vim 插件，详情请跳转 [vim-plug](./vim-plug.md)。

## 示例

在下面示例中使用 `cs"'` 按键：

```
"hello world"
```

修改结果：

```
'hello world'
```

使用 `cs'<q>` 后结果为：

```
<q>hello world</q>
```

修改标签为双引号，`cst"`，结果为：

```
"hello world"
```

移除双引号，`ds"`，结果为：

```
hello world
```

给 `hello` 添加方括号，将光标移至 `hello` 上，`ysiw]`，这里的 `iw` 按键即为文本对象，结果为：

```
[hello] world
```

使用花括号代替方括号，并在 `hello` 两边添加空格，`cs]{`，结果为：

```
{ hello } world
```

使用圆括号包裹整个语句，`yssb` 或者 `yss)`，结果为：

```
({ hello } world)
```

删除括号， `ds{ds(`，结果为：

```
hello world
```

使用 XML 标签包裹文本，`ysiw<em>`，结果为：

```
<em>hello</em> world
```

最后，看一下**可视模式**。按下 `V`，然后跟 `S<p class="important">`，结果：

```
<p class="important">
  <em>Hello</em> world!
</p>
```

## key mappings

* `ds` - 删除包裹符号
* `cs` - 替换包裹符号
* `ys` - 给 target

## targets

`ds` `cs` 两个命令都需要接收一个对象作为他们都第一个参数。这些对象都是基于 Vim 提供的 **文本对象（text-objects）**。

vim-surround 命令可操作的包裹符号如下：

### 标点符号

 `(` `)` `{` `}` `[` `]` `<` `>` 一共八个。这些符号有属于自己的别名，b，B，r 和 a 分别代表 )，}，] 和 >。

### 引用符号

一共三个：', ", \`，成堆出现。

### XML 标签

`t` 用于标示一个 HTML 或者 XML 标签。

### word

`w` `W` 和 `s` 分别表示 Vim 中的 word、WORD 和 sentence。

### 段落

`p` 表示光标当前所在的段落。

## 参考

* [Vim Text Objects: The Definitive Guide](https://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/)

## Author Info

* [GitHub](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

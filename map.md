# 按键映射

在使用文本编辑器的过程中，我们总会根据自己的喜好定制属于自己的快捷键，在 Vim 中叫做按键映射（map）。方式即为通过 `:map` 命令：

```viml
:map <space> :echo 'foo'<CR>
```

上面的 `:map` 命令将空格键 `<space>` 的功能进行来重新定义，使其在按下时在命令行中输出 `foo` 这个单词，这就是最基本的按键映射定义。

## 不同模式下定义按键映射

我们知道 Vim 中有很多种不同的模式，所以映射的定义也有很多种不同的方法，不同的 `:map` 命令的变种命令的使用方式、作用域以及应用场景也有区别：

| 递归 | 非递归 | 取消 | 适用模式|
|------|--------|------|---------|
| :map  |  :noremap  | :unmap  |  Normal, Visual, Select, Operator-pending |
| :nmap |  :nnoremap | :nunmap |  Normal |
| :vmap |  :vnoremap | :vunmap |  Visual and Select |
| :smap |  :snoremap | :sunmap |  Select |
| :xmap |  :xnoremap | :xunmap |  Visual |
| :omap |  :onoremap | :ounmap |  Operator-pending |
| :map! |  :noremap! | :unmap! |  Insert and Command-line |
| :imap |  :inoremap | :iunmap |  Insert |
| :lmap |  :lnoremap | :lunmap |  Insert, Command-line, Lang-Arg |
| :cmap |  :cnoremap | :cunmap |  Command-line |
| :tmap |  :tnoremap | :tunmap |  Terminal-Job |

PS. 该表格可以通过 `:h map-modes` 命令查看帮助文档，其中有详细的描述。

从上表可知，不同的 `:xmap` 命令生效的模式不同，即 `:nmap` 命令定义的快捷键只在 普通模式 下有效，在其他模式下该映射无效；本着权限最小化的原则，如果一个映射只想在某个特定的模式下使用时，建议使用对应的 `:xmap` 命令，不要一股脑地使用 `:map` 命令，否则可能对其他模式中的功能键造成影响。

### 递归 VS 非递归

在进行按键映射设置时，会有一个递归的特性，例如：

```viml
nmap b :echo 'hello'<CR>
nmap a b
```

我们知道在普通模式中，`b` 键的功能是将光标向后后退一个 word；上面设置中第二行的本意是使 `a` 的功能为在敲击时将光标向后移动一个 word，但是实际情况却是 `hello` 被输出到了命令行中。这是因为在上面的第一行中将 `:echo 'hello'<CR>` 作为了 `b` 映射，而 `nmap` 命令会对 `b` 进行递归，所以递归的结果就是：

```viml
nmap a :echo 'hello'<CR>
```

所以在日常的使用中，除非有必要，否则一律使用映射命令的非递归模式。

## 映射前置键

在定制属于自己的按键映射时，可以给按键组合添加一个前置键（leader键）。leader 键默认为 `\\` 键，但是也可以根据自己的喜好进行重新定义，定义的方式如下：

```viml
let mapleader = {char}
```

上面的 `{char}` 即为要重新设置的 leader 键。

leader 键的存在在某种程度上增加了可使用映射的个数，例如，对于单纯的按键 `a` 来说，其功能已经在 Vim 中内置了；但是通过使用 leader 键来组合的话，就相当于我们又多了一个映射，例如：

```viml
nnoremap <leader>a :echo 'a'<CR>
```

通过组合 leader 键和 `a`，我们就多了一个映射，用来在命令行中输出 `a`。当然这只是一个示例，在实际使用中，我们会使用按键映射来实现更使用的功能。

如果要在按键映射中使用 leader 键，在设置中，通过 `<leader>` 的方式来表示 leader 键：

```viml
let mapleader = ','
nnoremap <leader>g :echo 'hello'<CR>
```

上面的命令首先将 `,` 键定义为 leader 键，然后使用 `<leader>g` 定义 `,g` 组合的功能为 `在命令行中输出 hello`。

**注意：**如果你打算设置 Leader 键，请确保在设置按键映射之前，先设置好 Leader 键。如果你先设置了含有 Leader 键的映射，然后又修改了 Leader 键，那么之前映射内的 Leader 键是不会因此而改变的。你可以通过执行 :nmap <leader> 来查看普通模式中已绑定给 Leader 键的所有映射。

## 参考

* [vim-galore-zh_cn](https://github.com/wsdjeg/vim-galore-zh_cn#%E6%8C%89%E9%94%AE%E6%98%A0%E5%B0%84)

## Author 🐩

* [GitHub](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

# vim-jsx

JSX 是用来将内联的 XML 文档碎片转换为 JavaScript 对象的转换器。vim-jsx 用来提供 JSX 文档的语法高亮和锁进功能。

由于 vim-jsx 并不提供 JavaScript 高亮的功能，只专注于 JSX 层面的语法高亮和锁进，所以需要配合其他 JavaScript 插件作为 JS 的语法高亮，官方推荐 [pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)；当然，vim-jsx 也支持其他 JavaScript 语法包，例如：

* pangloss/vim-javascript
* jelera/vim-javascript-syntax
* othree/yajs

## 用法

默认情况下，JSX 的语法高亮和锁进功能在 `.js` 和 `.jsx` 文件中都会开启，用户可以通过下面的方式限制只在 `.jsx` 文件中开启：

```vimrc
let g:jsx_ext_required = 1
```

将上面的命令放在 `.vimrc` 文件中即可。

## 管理

推荐使用 [vim-plug](./vim-plug.md) 来管理该插件。

## 其他安装方式

下面是官方文档中推荐的几种下载安装方式：

### Pathogen

GitHub 仓库地址请戳 👉 [Pathogen](https://github.com/tpope/vim-pathogen)。Pathogen 管理插件的方式比较原始，主要是通过管理 `runtimepath` 的方式来管理插件，通过修改 `runtimepath` 来修改 Vim 查找运行时文件的目录。

安装好 Pathogen 之后，只需要在 `~/.vim/bundle` 中下载 vim-jsx 即可：

```shell
git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
```

### Vundle

Vundle 跟 vim-plug 类似，首先在 `.vimrc` 文件中声明要加载的插件：

```vimrc
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
```

然后在打开的 Vim 中运行：

```vimrc
:so ~/.vimrc # 用来重新加载 .vimrc 文件
:PluginInstall # 安装插件
```

### 手动安装

1、如果当前环境中没有 `~/.vim/after` 目录时，直接将下载的 vim-jsx 压缩包解压后将内容拷贝到 `~/.vim` 目录中。

2、如果已经有 `~/.vim/after` 目录，将 syntax 和 indent 目录下的文件分别拷贝到对应的目录中；如果 after 目录中已经存在 syntax 和 indent 目录时，可以执行如下操作：

```shell
mkdir -p ~/.vim/after/syntax/javascript
cp path/to/vim-jsx/after/syntax/jsx.vim ~/.vim/after/syntax/javascript/jsx.vim
mkdir -p ~/.vim/after/indent/javascript
cp path/to/vim-jsx/after/indent/jsx.vim ~/.vim/after/indent/javascript/jsx.vim
```

## Author Info 🦔

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

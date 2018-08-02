# vim-textobj-entire

该插件的功能比较简单，在 Vim 默认文本对象的基础上提供了两个新的文本对象：

* `ae` - 该文本对象会选中当前 buffer 的所有内容
* `ie` - 该文本对象也会选中当前 buffer 的所有内容，但是不包括起始&结尾的空行

对 Vim 文本对象（text objects）不熟悉的可以参考扩展阅读部分对文本对象的介绍。
## 安装

推荐使用 [vim-plug](./vim-plug.md) 来管理该插件。

## Repo

[kana/vim-textobj-entire](https://github.com/kana/vim-textobj-entire).

## 依赖

该插件依赖 [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user) 插件，所以这两个插件需要同时安装。

vim-textobj-user 插件对 Vim 的自定义文本对象功能进行来封装，对自定义文本对象过程中可能出现的陷阱进行了屏蔽封装，降低了自定义文本对象的难度。vim-textobj-entire 中定义的两个文本对象也是在该插件的基础上实现的。想要自定义文本对象的可以仔细阅读该插件的文档。

## 扩展阅读 - text object

* [Text objects](http://vimdoc.sourceforge.net/htmldoc/usr_04.html#04.8)

## Author

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

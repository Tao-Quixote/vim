# image.vim

今天介绍的这个插件有点鸡肋，作用不是很大。

在 Vim 中，不能预览图片。但是有一项非常成熟的技术，那就是使用 ASCII 字符来标示一张图片的内容，示例如下图：

![](https://github.com/ashisha/image.vim/raw/master/screenshot/image.vim.jpg)

今天介绍的这个插件 [image.vim](https://github.com/ashisha/image.vim) 就是来做这个的。

## 依赖

该插件依赖 `python`，所以如果你的 Vim 不支持 python 的话，那么你需要重新下载一个支持 python 的 Vim，检测是否支持 python 的方式如下：

```shell
vim --version | grep python
```

如果可以在输出中看到 `+python` 的话，就标示你的 Vim 支持 python。

另外，该插件还依赖一个 python 库 - Pillow。所以你需要 python 的包管理工具 pip 来下载安装该库：

```shell
pip install Pillow
```

## 下载安装 pip

有的版本的 python 自带 pip，但是有的版本没有包含 pip。所以如果你的 python 没有包含 pip 的话，那么你需要安装 pip 来下载依赖库：

```shell
> curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
> python get-pip.py
```

这样差不多就安装好了。如果感觉没有安装好的话，详情请跳转 [Pip install](https://pip.readthedocs.io/en/stable/installing/)。

## 管理

推荐使用 [vim-plug](./vim-plug.md) 来管理该插件。

## keymappings or shortkeys?

该插件没有任何映射或者快捷键，在 NERDTree 窗口中将光标移动到图片名字上直接点击回车就可以预览。

## 注意⚠️

不要在预览窗口修改 ASCII 字符，强行修改，会损坏原图片。

## Author Info 🐆

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

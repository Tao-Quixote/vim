# window's cheatsheets

## 分割窗口

* `<C-w>s` - 水平分割当前活跃窗口
* `<C-w>v` - 垂直分割当前活跃窗口
* `:sp[lit] filename` - 水平分割当前活跃窗口
* `:vsp[lit] filename` - 垂直分割当前活跃窗口

## 关闭窗口

* `:q[uit]` - 关闭当前活跃窗口
* `:on[ly]` - 关闭除当前窗口之外的所有其他窗口

## 切换窗口

* `<C-w>w` - 循环切换窗口
* `<C-w>h` - 激活当前窗口左边的窗口
* `<C-w>j` - 激活当前窗口下边的窗口
* `<C-w>k` - 激活当前窗口上边的窗口
* `<C-w>l` - 激活当前窗口右边的窗口

### shortkeys

可以使用下面定义的快捷键来减少按键次数：

```viml
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
```

## 移动窗口

* `<C-w>x` - 将当前窗口与相邻的窗口交换位置
* `<C-w>H` - 将当前窗口移动到最左边
* `<C-w>J` - 将当前窗口移动到最下边
* `<C-w>K` - 将当前窗口移动到最上边
* `<C-w>L` - 将当前窗口移动到最右边

## 调整窗口大小

* `<C-w>=` - 使所有窗口等大
* `<C-w>|` - 使当前窗口最高
* `<C-w>_` - 使当前窗口最宽
* `<C-w>+` - 当前窗口高度增加一行
* `<C-w>-` - 当前窗口高度减少一行

## 参考

* [Working with windows](http://vimcasts.org/episodes/working-with-windows/)

## Author 🐘

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

# substitute

缺省情况下 substitute 命令只会替换第一个匹配的位置，要想修改所有的匹配，需要使用特殊标志位 `g`。

## 替换的完整模式

```viml
:[range]s[ubstitute]/{pattern}/{string}/[flags]
```

* `[range]` - substitute 命令的范围
* `{pattern}` - 匹配模式，参见 [pattern](./pattern.md)
* `{string}` - 用来替换匹配内容的字符串
* `[flags]` - 标志位，用来约束 substitute 命令的行为

## flags

* `g` - 使 substitute 命令作用于匹配到的所有内容
* `c` - 在替换之前先确认是否替换
* `n` - 不执行替换，只统计 substitute 命令匹配到的个数
* `&` - 告诉 substitute 命令使用上次的标志位
* `e` - 用来屏蔽未查找到时的报错

## 标志位 c

当我们想逐一查看匹配选项然后决定是否替换时，可以使用 c 标志位来实现。当匹配到内容时，Vim 会提醒是否替换，提示：

```viml
replace with [content] (y/n/a/q/l/^E/^Y)?
```

提示是否使用 `[content]` 来替换匹配到的内容，这里的 `[content]` 即为上面的 `{string}`。提示信息的意义如下：

* y - 替换此处的匹配
* n - 跳过此处匹配
* a - all，替换此处及之后的所有匹配
* q - 退出替换过程
* l - last，替换此处匹配后退出
* `<C-e>` - 向上滚动内容
* `<C-y>` - 向下滚动内容

## Author 🐕

* [GitHub](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

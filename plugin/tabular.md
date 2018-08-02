# tabular

在开发或者文档的书写过程中，有时候会用到代码对齐的功能，用来提高代码的可读性。如果手动来设置代码对齐的话会非常麻烦，我们当然希望这种事情可以交给电脑来完成。今天介绍的这个插件：[tabular](https://github.com/godlygeek/tabular) 就是用来完成代码/文档对齐的。

例如：

```javascript
var video = {
    metadata: {
        title: "Aligning assignments"
        h264Src: "/media/alignment.mov",
        oggSrc: "/media/alignment.ogv"
        posterSrc: "/media/alignment.png"
        duration: 320,
    }
}
```

在有的团队规范中，可能希望是下面这种对齐的方式：

```javascript
var video = {
    metadata: {
        title     : "Aligning assignments"
        h264Src   : "/media/alignment.mov",
        oggSrc    : "/media/alignment.ogv"
        posterSrc : "/media/alignment.png"
        duration  : 320,
    }
}
```
上面这种对齐方式可以通过 tabular 提供的 `:Tab /:` 命令来完成。

或者下面这种对齐方式：

```javascript
var video = {
    metadata: {
        title:      "Aligning assignments"
        h264Src:    "/media/alignment.mov",
        oggSrc:     "/media/alignment.ogv"
        posterSrc:  "/media/alignment.png"
        duration:   320,
    }
}
```

上面这种对齐方式可以通过 tabular 提供的 `:Tab /:\zs` 命令来完成。

如果在 markdown 文档中，对于表格的对齐，也可以使用 tabular 完成，例如：

```markdown
Scenario Outline: eating
  Given there are &lt;start&gt; cucumbers
  When I eat &lt;eat&gt; cucumbers
  Then I should have &lt;left&gt; cucumbers

  Examples:
    |start|eat|left|
    |12|5|7|
    |20|5|15|
```

将光标移动到表格部分，使用 `:Tab/|` 后，结果如下：

```markdown
Scenario Outline: eating
  Given there are &lt;start&gt; cucumbers
  When I eat &lt;eat&gt; cucumbers
  Then I should have &lt;left&gt; cucumbers

  Examples:
    | start | eat | left |
    | 12    | 5   | 7    |
    | 20    | 5   | 15   |
```

其实上面展示的例子，已经可以满足日常开发中的对齐需求，如果还不满足可以继续往下看。

## walkthrough

Tabular 插件提供的命令基于正则表达式。其基本思路为通过正则表达式匹配不同部分之间的分隔符，将输入的行在分隔符的位置断开，将断开部分的去除不必要的空格，然后在分隔符的两边的部分分别加上相同数量的空格使其分隔符两边的距离相等，然后再把分割后的部分与分隔符组装在一起。如下：

```
test ,test
```

`:Tab /,` 命令的使用会使 Tabular 将上面的句子分割为三部分: `test `、`,` 和 `test`，其中第一部分包含一个空格；Tabular 去除第一部分和第三部分中不必要的空格，然后再在第一部分的最后和第三部分的开头添加数量相等的空格；最后再将三部分组装起来输出，这里就做到了对齐的功能。

其他的高级用法，如 `:Tab /:/r1l2`，只不过是针对不同的参数在不同的部分添加不同数量的空格，最后组装在一起。前面`:Tab /:/r1l2` 的结果为：

```
test ,  test
```

## 注意

* Tabular 插件命令的完整写法为 `Tabularize`。虽然可以通过映射的方式使用 `:Tab` 作为 Tabular 的命令，但是并不推荐这么做，因为很可能会跟其他插件的命令冲突;
* 如果只使用 `:Tabularize` 而没有提供匹配模式的话，Tabular 会使用上次的匹配模式来工作；

## 参考

* [doc/Tabular.txt](http://raw.github.com/godlygeek/tabular/master/doc/Tabular.txt)
* [Aligning Text with Tabular.vim](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)

## Author

* [Github](https://github.com/Tao-Quixote)
* Email: <web.taox@gmail.com>

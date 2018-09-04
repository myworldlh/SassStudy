# Sass学习笔记

* 本文是Sass官网的安装教程整理出来的，并做了一些补充和建议（[参考地址](https://www.sass.hk/skill/koala-app.html "Sass安装")）
* 其中附带compass的整理笔记

#### 知识总结

        compass中集合了sass的很多方法，而sass又是css的一种超级
        sass让css程序化编写变为现实，而compass提供了诸多方法，解决了很多难关
        compass → sass → css，希望以后能成为编写代码的主要手段

#### 比较好用的方法总结

* 1.normalize 统一浏览器行为插件，另一种形式的reset
* 2.layout模块：@include stretch();生成position为absolute的拉伸样式，通过参数控制上右下左的值，不传为0，例：top: 0;
* 3.浏览器支持：$supported-browsers: chrome, ie;
* 4.CSS3模块
* 5.typography模块lists设置父元素及li的排版样式
* 6.typography模块text设置文本超出...：ellipsis
* 7.typography模块text设置按钮字隐藏：replace-text
* 8.大段文本可以使用垂直韵律，规定行高字体
* 9.helper：引入图片image-url、引入字体文件font-face、组合选择器append-selector、计算图片高：image-height、图片转码base64：inline-image
* 10.utilities模块伪类清除浮动：legacy-pie-clearfix；兼容设置浮动：float()
* 11.utilities模块合图sprites：参见_icon.scss
* 12.兼容低版本浏览器参见：hack模块和Minimum模块

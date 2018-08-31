# COMPASS 笔记

#### compass是sass的二次开发工具，[compass官网](http://compass-style.org)

#### 安装compass
```gem install compass```
#### 查看compass版本
```compass -v```
#### compass 创建项目
```compass create 项目名```
#### compass 编译项目
```compass compile```
#### compass 监听项目
```compass watch```


## compass核心模块

### Reset ：重置CSS模块
``` @import "compass/reset"```
### Layout ：页面布局的控制能力
```@import "compass/layout"```
`只有这两个模块是需要明确 指定引入的,@import "compass"默认包含了其他五大模块却不包含resrt,layout`
```
其他四个功能模块和Browser support模块
CSS3：跨浏览器的CSS3能力
Helpers：内含一系列的函数，跟SASS的函数列表很像，比较少用，功能确实 丰富强大
Typography：修饰我们的文本样式，垂直韵律
Utilities：没有办法放到其他模块的内容都可以放到这个模块里。辅助工具 类模块，helpers都是函数，utilities多是mixin
Browser：配置compass默认支持哪些浏览器。对于特定浏览器默认支持到哪 个版本。一个修改将影响六个模块的输出。不同的浏览器做不同的适配。
```

## Compass核心模块概述&Reset模块

### compass-normalize插件命令安装：
```gem install compass-normalize```
### 引入compass-normalize插件
config.rb文件里：
``` require 'compass-normalize'```
扩展：
```
config.rb文件里的import-once解决了多次@import同一个文件，compass也只会插入一次被引入问件。但使用了import-once万一遇到真的遇到一个文件 必须被引入两次的情况，可以通过被引入文件的文件名的后面加一个感叹号 ！方式来告知compass这里需要重复引入。@import "compass/reset!"
```
### 在SCSS文件中引用normalize
```@import "normalize";```


## Normalize核心模块：
```
base：用来统一HTML和body标签的字体，文字大小调整、边距等等。
html5：统一html5中新增的元素的展现形式
links：统一a便签的样式修饰，去掉hover和active时候的边线。
typography：统一b、strong、sub、sup等段落文本的样式修饰。
embeds：统一img，svg等标签的样式修饰（比如统一img标签的border为0 ）
groups：统一figure、pre、code等标签的样式
forms：统一form相关的button、input、等标签的样式
tables：统一table相关的table、td、th等标签的样式
```

### 引入(通过子路径的方式)：
```
@import "normalize-version"//--在引入子类之前需要引入normalize-version
@import "normalize/base"
```
```
@import "compass/reset";
其实就是引入了compass/reset/untlities，然后调用了其中的一个global-reset();的mixin集合。

@import "compass/reset/untlities";
include global-reset();
```

### reset Utilities核心mixin
[http://compass-style.org/reference/compass/reset/utilities/](http://compass-style.org/reference/compass/reset/utilities/)
`nested-reset`：只用于重置我们页面上的某个选择器下的所有元素。<br>
例如重置reset-sec的所有元素：
```
.reset-sec{
    @include nested-reset;
}

.reset-sec div, .reset-sec a 等等所有标签全部重置样式为
{
    margin: 0;
    padding: 0;
    border: 0;
    font: inherit;
    font-size: 100%;
    vertical-aligin: baseline;
}
```

## Layout模块（使用率最低的模块）
layout模块下面又细分3个核心mixin模块，可以分别引入。

```
@import "compass/layout";
@import "compass/layout/grid-background";
@import "compass/layout/sticky-footer";
@import "compass/layout/stretching";
```

### stretching模块，按父元素尺寸拉伸元素，示例：
```
.stretch-full {
    @include stretch();
}
.stretch-full2 {
    @include stretch(5px,0px,5px,5px); //非0值单位px不可省
}
.stretch-full3 {
    @include stretch($offset-top:5px,$offset-right:0px,$offset-bottom:5px,$offset-left:5px); //参数顺序可变,非0值单位px不可省
}
```

### 经过sass转换后代码：
```
.stretch-full {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}
.stretch-full2 {
    position: absolute;
    top: 5px;
    bottom: 0;
    left: 5px; right: 5px;
}
.stretch-full3 {
    position: absolute; 
    top: 5px;
    bottom: 5px;
    left: 5px; right: 0px;
}
```

### sticky-footer模块,提供footer总在页面最底部的解决方案，需要固定的结构：
```
<body>
    <div id="root">
        <div id="root_footer"></div>
    </div>
    <div id="footer">
        Footer content goes here.
    </div>
</body>
```
```
@include sticky-footer(54px) //参数为footer高度
@include sticky-footer(54px, "#my-root", "#my-root-footer", "#my-footer") // 自定义选择器
```

## CSS3模块&Browser Support模块(主动使用率较高的模块)

### 在用CSS3模块的时候要调整Browser Support模块的配置，即使不主动调整CSS3也引入了Browser Support模块。CSS3模块主要用于跨浏览的CSS3的能力。
```
@import "compass/css3";
.webdome-sec{
    @include box-shadow(1px 1px 3px 2px #cfcecf);
}
```
生成的代码：
```
.webdemo-sec {
    -moz-box-shadow: 1px 1px 3px 2px #cfcedf;
    -webkit-box-shadow: 1px 1px 3px 2px #cfcedf;
    box-shadow: 1px 1px 3px 2px #cfcedf;
}
```

### 假如不需要自动生成Firefox的适配代码，这时就需要用Browser Support模块。来配置compass默认支持哪些浏览器。对于特定浏览器支持到哪个版本。Browser Support模块一但修改将影响其余六个模块的输出。

``` 引入support： @import "compass/support";```

引入了CSS3模块，相当于间接引入了support模块。<br>
查看当前支持的浏览器版本：<br>
控制台命令：
```
1 compass interactive //进入一个用于测试Compass中SassScript的控制台
2 browsers() //查看支持的浏览器
3 browser-versions(chrome) //查看支持的chrome版本
```

在sass文件中输入 @debug browsers() 控制台也会打印出支持的浏览器。<br>
设置compass支持的浏览器：
```
@import "compass/css3";
$supported-browsers: chrome firefox;
```

也可以写成： `$supported-browsers: chrome,firefox ;`  浏览器队列用 空格或者逗号分隔均可。<br>
### 设置compass支持的浏览器的最低版本（compass默认支持到ie5.5）：
```$browser-minimum-versions:("ie":"8","":"")```
不设置的话 默认支持 browsers-versions 返回的的版本。

### Animation：CSS3动画相关的特性。
```
Appearance：CSS3的appearance属性，也是CSS3的新规范中新定义的新属性。（还没有一个主流的浏览器支持这个属性）
Background Clip、Background Origin、Background Size：CSS3新增的background相关的属性，用来规定背景的绘制区域、背景图像的定位原点、背景图像的尺寸等。
Border Radius：边框圆角属性
Box、Box Shadow
Box Sizing：用来修改盒模型的宽高的度量方式。
CSS Regions：控制内容布局的新方式
CSS3 Pie：尽可能提高ie浏览器呈现许多CSS3功能
Columns：CSS3的多列布局属性
Filter：主要用于在图片上实现一些特效
Flexbox：（移动端web开发用的比较多）
Font Face：不依赖于用户计算机上安装好的字体，指定下载好的某一种字体
Hyphenation：如何断字换行
Images：CSS3新增了这种生成渐变图形的方式，images用于需要使用这两种方式充当图片的场景。
Inline Block：实现跨浏览器的display:inline-block;能力
Opacity：透明属性，为了兼容低版本的IE
Selection：使用CSS3的selection伪元素定义被选中文本的颜色和背景色
Shared Utilities：想贡献CSS3模块的相关compass插件会用到。工具类模块
Text Shadow：文字阴影属性
Transform、Transition：变幻动画属性
User Interface：限制某一区域是否允许鼠标拖拽选择，input元素在无填写状态下提示语的样式
```

## Typography模块

### 分为四个模块：
#### Links：链接修饰模块正常态下去掉下划线，在hover的情况下才显示这个下划线hover-link();
```
a{
    @include hover-link();
}
```
编译之后：
```
a {
    text-decoration: none;
}
a:hover, a:focus {
    text-decoration: underline;
}
```

修改不同状态下超链接的颜色link-colors<br>
抹平超链接样式，和他跟父容器的文本无异unstyled Link<br>

#### Lists：列表修饰模块
```@import "compass/typography/lists";```
自动生成父样式和li样式
```
// li 默认样式
.ul-li-no-bullets{
    @include no-bullets();
}
// li浮动
.li-horizontal-list{
    @include horizontal-list(2px, right);
}
// li inline内联元素
.li-inline-list{
    @include inline-list();
}
// li inline-block内联块
.li-inline-block-list{
    @include inline-block-list();
}
```

#### Text：文本修饰模块
```@import "compass/typography/text";```
* 超出显示...`ellipsis`
* 单独配置低版本Firefox对ellipsis的兼容，需要先下载插件: compass install compass/ellipsis，生成对应的xml文件
```$use-mozilla-ellipsis-binding: true; 开启使用兼容低版本Firefox的ellipsis```
```
// scss
.text-ellipsis{
    @include ellipsis();
}
// css
.text-ellipsis {
  white-space: nowrap;
  overflow: hidden;
  -ms-text-overflow: ellipsis;
  -o-text-overflow: ellipsis;
  text-overflow: ellipsis;
  -moz-binding: url('xml/ellipsis.xml#ellipsis');
}
```
* 给一个按钮添加背景图，如果途中有对应显示的字了，就需要对字进行操作`replace-text`
```
// 对文字进行隐藏
.text-hide{
    // 两种隐藏方式
    //@include hide-text();
    @include squish-text();
}
// 隐藏字并且设置图片路径
// scss
.btn-find{
    @include replace-text("https://raw.githubusercontent.com/myworldlh/Images-Warehouse/master/pictures/%E5%A5%B6%E6%B2%B9.JPG");
}
// css
.btn-find {
  text-indent: -119988px;
  overflow: hidden;
  text-align: left;
  background-image: url(https://raw.githubusercontent.com/myworldlh/Images-Warehouse/master/pictures/%E5%A5%B6%E6%B2%B9.JPG);
  background-repeat: no-repeat;
  background-position: 50% 50%;
}
```
* 如果背景图片比按钮小，则可以使用`replace-text-with-dimensions`，将会根据图片的宽高对元素进行设置
```
// scss
.btn-replace-text-with-dimensions{
    @include replace-text-with-dimensions("CR7-head.jpg"); // 不知道为什么绝对路径不行
}
// css
.btn-replace-text-with-dimensions {
  text-indent: -119988px;
  overflow: hidden;
  text-align: left;
  background-image: url('../images/CR7-head.jpg?1528764749');
  background-repeat: no-repeat;
  background-position: 50% 50%;
  width: 1600px;
  height: 900px;
}
```



#### Vertical Rhythm：垂直韵律修饰模块
```@import "compass/typography/vertical_rhythm";```

垂直韵律模块一般应用于文本阅读器中，需要规定文本的字体和基准高，通常使用fong-size:16px;line-height:24px;<br>
调试的时候可以使用背景调试线来调试。<br>

垂直韵律的核心是设置行间距为基准高的整数倍<br>
$base-font-size: 16px;  设置基础字体大小<br>
$base-line-heigth: 24px; 设置文本基线高度，通常高度为行高的1.4或1.5倍，这里为1.5倍<br>

先去掉页面的margin和padding: @import "compass/resset";<br>
为给定的font-size建立字体基线： @include establish-baseline(); 生成的样式如下<br>
```
html{
    font-size: 100%;
    inline-height: 1.5em;   // 24 / 16 = 1.5
}
```
调试对齐的背景图像：<br>
```
// scss 
body{
    @include debug-vertical-alignment;
}
// css
body {
  background-image: -webkit-linear-gradient(bottom, rgba(0, 0, 0, 0.5) 5%, rgba(0, 0, 0, 0) 5%);
  background-image: linear-gradient(to top, rgba(0, 0, 0, 0.5) 5%, rgba(0, 0, 0, 0) 5%);
  -webkit-background-size: 100% 1.5em;
  background-size: 100% 1.5em;
  background-position: left top;
}
```
* adjust-font-size-to(字体大小)：自动计算字体和行高的倍率em
* 计算过程：字体大小 = 传入字体大小/基准大小（单位em），行高 = 基线行高的整数倍/字体大小
* 例如h2： font-size: 36/16 = 2.25em; line-height: 24*2 / 36 = 1.333333em; (因为字体大小为36px，基线高为24px，所以两倍基线高是合理高度)
```
// scss
h1{
    @include adjust-font-size-to(48px);
}
h2{
    @include adjust-font-size-to(36px);
}
h3{
    @include adjust-font-size-to(24px)
}
h4{
    @include adjust-font-size-to(21px);
}
h5{
    @include adjust-font-size-to(18px);
}
h6{
    @include adjust-font-size-to(16px);
}
p{
    @include adjust-font-size-to(16px);
    @include leader(); // margin-top: 几倍于基线的高，默认1倍
    @include trailer(); // margin-bottom: 几倍于基线的高，默认1倍
}

// css
h1 { font-size: 3em; line-height: 1.5em; }
h2 { font-size: 2.25em; line-height: 1.33333em; }
h3 { font-size: 1.5em; line-height: 2em; }
h4 { font-size: 1.3125em; line-height: 2.28571em; }
h5 { font-size: 1.125em; line-height: 1.33333em; }
h6 { font-size: 1em; line-height: 1.5em; }
p { font-size: 1em; line-height: 1.5em; margin-top: 1.5em; margin-bottom: 1.5em; }

```



## helper模块

#### 引入图片image-url

* image-url():会将图片的路径自动加载出来，并且自动添加cache buster缓存克星，解决更换图片的缓存问题（每次编译自动在路径末尾添加新的时间戳）
* 图片的路径和config.rb中的配置有关，详情见config.rb
* 对于图片的路径配置、cache配置等，参考helpers模块

```
// config.rb
http_path = "/"  # 请求的路径配置，可以使用网络路径如：http://baidu.com/demo-project/images/
images_dir = "images" # 图片的存放路径，这样才能使用compass的功能操作图片
relative_assets = true
# 使用的路径是否为相对路径，开启relative_assets = true后，文件的路径将使用相对路径

// scss
.artical-logo{
    background-image: image-url("CR7-head.jpg");
}

// css
.artical-logo {
  background-image: url('../images/CR7-head.jpg?1528764749');
}
```

#### 工作环境compass-env
develop开发环境和production生产环境：`compass-env();`
```@debug compass-env();  在控制台中打印当前的工作环境```
* 可以通过命令行:`compass compile -e production --force`来强制更换工作环境
* 也可以通过在config.rb中使用environment = :development 或者 :production来切换
* production生产环境编译出来的css中没有开发的行号注释

#### 引入font字体font-face
引入字体，compass会自动生成对应的format，避免了手动手写出现的问题，同事生成了cache buster
```
// scss
@include font-face('FontAwesome-webfont.eot','FontAwesome-webfont.svg','FontAwesome-webfont.ttf','FontAwesome-webfont.woff','FontAwesome-webfont.otf');
// css
@font-face {
  font-family: "FontAwesome-webfont.eot";
  src: url('../fonts/FontAwesome-webfont.ttf?1371483119');
  src: url('../fonts/FontAwesome-webfont.ttf?&1371483119#iefix') format('embedded-opentype'), "FontAwesome-webfont.svg";
  font-weight: "FontAwesome-webfont.woff";
  font-style: "FontAwesome-webfont.otf";
}

```

#### 图片转码base64 inline-image
```
// 将图片转换成base64编码，对于小图片来说有用，减少请求次数，但是对于大文件来说反而消耗了更多的cpu内存等资源
// 指定的路径应该为相对于项目的images图片路径
.bg-base64{
    //background-image: inline-image('CR7-head.jpg');
}
```

#### 组合选择器append-selector
组合选择器一定要是用#{}包裹起来，这是因为是要将被组合的选择器以字符串的形式拼接形成，所以需要#{}来操作字符串拼接
```
// scss
#{append-selector("p,div,a",".bar")}{
    color: #f00;
}
// css
p.bar, div.bar, a.bar {
  color: #f00;
}
```


## Utilities模块

#### print打印模块
```@import "compass/utilities/print"```
设置打印模块的时候，要同时操作两个scss，宿主.scss和print.scss

```
// screen.scss
@import "compass/utilities/print";
@include print-utilities(screen);
// print.scss
@import "compass/utilities/print";
@include print-utilities();

页面引入的代码在print.scss中（只有在打印的时候才会引入print.css）：
<link href="/stylesheets/print.css" media="print" rel="stylesheet" type="text/css" />
```

#### general模块
```@import "compass/utilities/general";```
```
// 清除浮动
.clearfix{
    // @include clearfix;
    // @include pie-clearfix; // 防止低版本不支持display: table;可以用下面的mixin
    @include legacy-pie-clearfix;
}
```

* float浮动
* $browser-minimum-versions为支持浏览器版本的配置，如果配置了支持ie6，compass会自动给我们解决ie6 float下双倍margin的问题
* 解决这个问题的方法是添加了display: inline;
* 有两种属性，一种是不影响布局如阴影box-shadow，一种影响布局如box-sizing，compass还配置了相关的阀值
* 第一种阀值为1%，第二种为0.1%，如果当前浏览器阀值大于compass规定阀值，就说明会影响到页面布局，则会生成对应的hack，如下面的display: inline;
* 查看阀值： @debug omitted-usage("ie", "6"); 0.0093
```
// scss
$browser-minimum-versions:("ie":"6");
@debug omitted-usage("ie", "6"); 
.float{
    @include float(left);
}
// css
.float {
  float: left;
  display: inline;
}
```

#### hack模块和Minimum模块
关于兼容ie6等操作，详情见[http://compass-style.org/reference/compass/utilities/general/hacks/](http://compass-style.org/reference/compass/utilities/general/hacks/)

#### Sprites模块

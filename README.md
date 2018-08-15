# Sass学习笔记

## 本文是Sass官网的安装教程整理出来的，并做了一些补充和建议（[参考地址](https://www.sass.hk/skill/koala-app.html "Sass安装")）

Sass是css的扩展语言，是对css的一种加工，能够定义变量和函数，并且有许多其他的用法，这将加快对css的编写，而且让css更有生命力。

sass基于Ruby语言开发而成，因此安装sass前需要安装`Ruby`。（注:mac下自带Ruby无需在安装Ruby!）<br>
window下安装SASS首先需要安装Ruby，先从官网下载Ruby并安装。安装过程中请注意勾选Add Ruby executables to your PATH添加到系统环境变量。

测试Ruby是否安装成功：`ruby -v`

但因为国内网络的问题导致gem源间歇性中断因此我们需要更换gem源。`（https://ruby.taobao.org/）`


#### 1.删除原gem源
```cmd
gem sources --remove https://rubygems.org/
```

#### 2.添加国内淘宝源
```cmd
gem sources -a https://ruby.taobao.org/
```

#### 3.打印是否替换成功
```cmd
gem sources -l
```

#### 4.更换成功后打印如下
```cmd
*** CURRENT SOURCES ***
https://ruby.taobao.org/
```


# 安装Sass

#### 安装如下(如mac安装遇到权限问题需加 sudo gem install sass)
```
gem install sass
```


# 命令行编译


#### 1.单文件转换命令
```
sass input.scss output.css
```

#### 2.单文件监听命令
```
sass --watch input.scss:output.css
```

#### 3.如果你有很多的sass文件的目录，你也可以告诉sass监听整个目录：
```
sass --watch app/sass:public/stylesheets
```


# 命令行编译配置选项

#### 命令行编译sass有配置选项，如编译过后css排版、生成调试map、开启debug信息等，<br>
#### 可通过使用命令sass -v查看详细。我们一般常用两种`--style`，`--sourcemap。`<br>
#### `--sourcemap` 新版本的Sass自动开启了这个功能

#### 1.编译格式
```
sass --watch input.scss:output.css --style compact
```

#### 2.编译添加调试map
```
sass --watch input.scss:output.css --sourcemap
```

#### 3.选择编译格式并添加调试map
```
sass --watch input.scss:output.css --style expanded --sourcemap
```

#### 4.开启debug信息
```
sass --watch input.scss:output.css --debug-info
```

    * --style表示解析后的css是什么排版格式; <br>
    sass内置有四种编译格式:nested``expanded``compact``compressed。<br>
    * --sourcemap表示开启sourcemap调试。开启sourcemap调试后，会生成一个后缀名为.css.map文件。


# 四种排版格式

## 未编译格式
```
//未编译样式
.box {
  width: 300px;
  height: 400px;
  &-title {
    height: 30px;
    line-height: 30px;
  }
}
```

## 1.nested 编译排版格式
```
/*命令行内容*/
sass style.scss:style.css --style nested

/*编译过后样式*/
.box {
  width: 300px;
  height: 400px; }
  .box-title {
    height: 30px;
    line-height: 30px; }
```

## 2.expanded 编译排版格式
```
/*命令行内容*/
sass style.scss:style.css --style expanded

/*编译过后样式*/
.box {
  width: 300px;
  height: 400px;
}
.box-title {
  height: 30px;
  line-height: 30px;
}
```

## 3.compact 编译排版格式
```
/*命令行内容*/
sass style.scss:style.css --style compact

/*编译过后样式*/
.box { width: 300px; height: 400px; }
.box-title { height: 30px; line-height: 30px; }
```

## 4.compressed 编译排版格式
```
/*命令行内容*/
sass style.scss:style.css --style compressed

/*编译过后样式*/
.box{width:300px;height:400px}.box-title{height:30px;line-height:30px}
```

    我习惯使用的编译方式为compact，以前编写css的时候习惯expanded，但是到了生产环境后，
    应该使用 `compressed` 排版格式，将减少缩小css体积并去掉注释
    

# 编译Sass的软件

    我使用的编译Sass的软件为 `koala` ，是一款界面简洁的编译软件
    下载好windows [koala](https://github.com/oklai/koala/releases/download/v2.2.0/KoalaSetup.exe "下载windows koala")之后
    在设置中调成简体中文，然后将想要转换的单个文件或这个项目导入，可以在右侧看到加载出来的文件，然后点击文件，可以选择`自动编译`
    这样就会在编译.scss文件的时候自动生成.css文件，并且监听实时编译
    更多关于koala的用法，前往官网查看 [koala 官网](http://koala-app.com/index-zh.html "koala 官网")

require 'compass/import-once/activate'
# compass中提供了一个方法，如果一个css多次引入了，就会产生css冗余，引入import-once/activate就会让多次引入变成之引入一次
# 如果个别sass一定要多次引入的话，可以再引入的末尾加上感叹号: @import "compass/reset!"
require 'compass-normalize'
# Require any additional compass plugins here.

# 设置compass的工作环境(development,production)
environment  = :development

# Set this to the root of your project when deployed:
http_path = "/"  # 请求的路径配置，可以使用网络路径如：http://baidu.com/demo-project/images/
css_dir = "stylesheets"
sass_dir = "sass"
images_dir = "images" # 图片的存放路径，这样才能使用compass的功能操作图片
javascripts_dir = "javascripts"
fonts_dir = "fonts"
# fonts_dir 字体文件引入路径

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed
output_style = :expanded

# 当output_style为compressed的时候，会将所有的css代码进行压缩，同时会去掉所有的注释，但是在很多开源项目中，是要求有对压缩文件的解释注释的
# 这时可以将注释的代码中，第一个字符加上感叹号，这样压缩出来的代码中就带有注释了：/*!这是必要的解释注释*/

# To enable relative paths to assets via compass helper functions. Uncomment:
# relative_assets = true
relative_assets = true
# 使用的路径是否为相对路径，开启relative_assets = true后，文件的路径将使用相对路径

# To disable debugging comments that display the original location of your selectors. Uncomment:
# line_comments = false
# 调试注释信息，如果设置为false就没有了调试注释信息：/* line 222, ../sass/screen.scss */

# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

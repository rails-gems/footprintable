# Footprintable
track model columns change

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'footprintable', github: 'rails-gems/footprintable'
```

And then execute:
```bash
$ bundle
```

## Usage
创建`model`
```
rails g model footprint before:text after:text action:string trackable:references{polymorphic} actorable:references{polymorphic}
```

添加代码到`footprint.rb`
```
serialize :before, JSON
serialize :after, JSON
```

* trackable, 追踪的对象（改变的model）
* actorable，导致对象改变的对象，比如操作者, 如果为空，默认为trackable本身

actorable 赋值当前操作者举例
```
# in controler
around_action :set_thread_footprint_actor
def set_thread_footprint_actor
  Footprintable::Current.actor = current_user
  yield
ensure
  # to address the thread variable leak issues in Puma/Thin webserver
  Footprintable::Current.actor = nil
end
```

需要追踪的model添加如下代码
```
include Footprintable
has_footprints(options) 
```
options, default: {}
* :on, after_commit actions, default: [:create, :update, :destroy]
* :except, 不需要记录的字段, default: [:updated_at, :created_at]
* :extract, 只需要记录的字段, default: [], 空指记录所有字段

`except`，`extract`的关系: `（changed_columns & extract） - except`

### fragment
```
def has_footprints options = {}
  # 触发时间
  options[:on]   ||= [:create, :update]
  # 摘取字段 [] => 所有字段
  options[:extract] ||= []
  # 排除字段
  options[:except] ||= [:updated_at, :created_at]
end
```

## 多数据库支持的配置方法
https://github.com/wuyuedefeng/blogs/issues/12

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

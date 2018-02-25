require 'active_support/core_ext/module/attribute_accessors_per_thread'
module Footprintable
  # rails 5
  # 当前线程导致数据改变的触发对象
  module Current
    thread_mattr_accessor :actor
  end
end
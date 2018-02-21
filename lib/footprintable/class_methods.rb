# except，extract的关系: (changed_columns & extract) - except
module Footprintable
  module ClassMethods
    def has_footprint options = {}
      # 触发时间
      options[:on]   ||= [:create, :update]
      # 摘取字段 [] => 所有字段
      options[:extract] ||= []
      # 排除字段
      options[:except] ||= [:updated_at, :created_at]
      self.footprint_options = options
      setup_callbacks_from_options(options[:on])
    end

    def setup_callbacks_from_options options_on = []
      options_on.each do |action|
        # send "after_#{option}", :create_footprint
        after_commit ->(obj) { obj.create_footprint action }, on: action
      end
    end
  end
end
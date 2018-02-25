require 'footprintable/class_methods'
require 'footprintable/instance_methods'
require 'footprintable/current'
module Footprintable

  def self.included(klass)
    klass.class_eval do
      has_many :footprints, as: :trackable
      class_attribute :footprint_options
    end
    klass.send :extend, ClassMethods
    klass.send :include, InstanceMethods
  end

end

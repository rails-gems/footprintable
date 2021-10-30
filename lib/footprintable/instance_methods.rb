require 'footprintable/current'
module Footprintable
  module InstanceMethods
    def create_footprint action
      if action == :destroy
        self.footprints.model.new(before: self, after: {}, action: action, trackable: self, actorable: Current.actor).save(validate: false)
      else
        attrs_changed = previous_changes
        attrs_changed = attrs_changed.except *self.class.footprint_options[:except]
        attrs_changed = attrs_changed.extract! *self.class.footprint_options[:extract] if self.class.footprint_options[:extract].present?
        return if attrs_changed.empty?

        attrs_before  = {}
        attrs_after = {}

        attrs_changed.each do |k, v|
          attrs_before.store(k, v.first)# unless v.first.nil?
          attrs_after.store(k, v.last)#  unless v.last.nil?
        end
        self.footprints.model.new(before: attrs_before, after: attrs_after, action: action, trackable: self, actorable: Current.actor).save(validate: false)
      end
    end
  end
end
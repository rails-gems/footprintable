module Footprintable
  # rails 5
  # 当前线程导致数据改变的触发对象
  module Current
    thread_mattr_accessor :actor
  end

  # in controler
  # around_action :set_thread_current_user
  # def set_thread_current_user
  #   Current.actor = current_user
  #   yield
  # ensure
  #   # to address the thread variable leak issues in Puma/Thin webserver
  #   Current.actor = nil
  # end
end
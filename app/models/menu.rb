class Menu < ActiveRecord::Base
	has_many :orders
  scope :for_display, ->{ where(display: true) }
end

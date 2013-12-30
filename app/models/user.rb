class User < ActiveRecord::Base
	has_many :orders
	has_many :menus, through: :orders

	def today_orders
		orders.where(created_at:  Time.now.beginning_of_day ..Time.now).order(priority: :asc)
	end
end

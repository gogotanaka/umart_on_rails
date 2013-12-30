class OrderController < ApplicationController
  def confirm
  	@user = User.find(params[:user_id])
  	params[:menus].each_value.with_index do |menu_hash,i|
	  	order = @user.orders.create!(
	  		menu_id:  menu_hash[:menu_id],
	  		amount:   menu_hash[:amount_id],
	  		priority: i
	  	)
	  	order.option_creater(menu_hash[:rice_options])
	  	order.option_creater(params[:options])
	  end
  end

  def execut!
  end

  def index
  end

  def recommend
  end
end

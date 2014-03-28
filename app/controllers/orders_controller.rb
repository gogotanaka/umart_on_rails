# coding: utf-8

class OrdersController < ApplicationController
  permits :user_id, :menu_id, :amount, :priority

  # GET /orders
  def index
    @users = User.all
    begin
      @no_eat_users = User.all.pluck(:name) - Order.today.map{|order| order.user.name}
    rescue
    end
  end

  # GET /orders/1
  def show(id)
    @order = Order.find(id)
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit(id)
    @order = Order.find(id)
  end

  # POST /orders
  def create(order)
    @user = User.find(params[:order][:user_id])
    cookies.permanent[:user_id] = @user.id
    params[:menus].each_value.with_index do |menu_hash,i|
      order = @user.orders.create!(
        menu_id:  menu_hash[:menu_id],
        amount:   menu_hash[:amount_id],
        priority: i
      )
      order.option_creater((menu_hash[:rice_options]||[]).map(&:to_i), :rice_option)
      order.option_creater(menu_hash[:remark], :remark)
      order.option_creater((params[:soup_options]||[]).map(&:to_i), :soup)

    end

    redirect_to orders_path
  end

  # PUT /orders/1
  def update(id, order)
    @order = Order.find(id)

    if @order.update(order)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /orders/1
  def destroy(id)
    @order = Order.find(id)
    @order.destroy

    redirect_to orders_url
  end
end

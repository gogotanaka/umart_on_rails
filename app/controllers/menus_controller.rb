# coding: utf-8

class MenusController < ApplicationController
  permits :name

  # GET /menus
  def index
    @menus = Menu.for_display
  end

  # GET /menus/1
  def show(id)
    @menu = Menu.find(id)
  end

  # GET /menus/new
  def new
    @menu = Menu.new
  end

  # GET /menus/1/edit
  def edit(id)
    @menu = Menu.find(id)
  end

  # POST /menus
  def create(menu)
    @menu = Menu.new(menu)

    if @menu.save
      redirect_to @menu, notice: 'Menu was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT /menus/1
  def update(id, menu)
    @menu = Menu.find(id)

    if @menu.update(menu)
      redirect_to @menu, notice: 'Menu was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /menus/1
  def destroy(id)
    @menu = Menu.find(id)
    @menu.display = false
    @menu.save

    redirect_to menus_url
  end
end

class WelcomeController < ApplicationController
  def index
  	@amount = {"普通" => 2, "特盛" => 4, "大盛り" => 3, "少なめ" => 1, "ご飯1/3" => 0}
  end

  def multiply_menu_ajax

  end
end

class WelcomeController < ApplicationController
  def index
    @user_id = cookies.permanent[:user_id]
    @amount_hash = {"特盛" => 4, "大盛り" => 3, "普通" => 2, "少なめ" => 1, "ご飯1/3" => 0}
  end

  def multiply_menu_ajax
    @amount_hash = {"特盛" => 4, "大盛り" => 3, "普通" => 2, "少なめ" => 1, "ご飯1/3" => 0}
    @index = params[:index].to_i + 1
  end
end

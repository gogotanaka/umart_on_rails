class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :options

	def amount_jp
		{"特盛" => 4, "大盛り" => 3, "普通" => 2, "少なめ" => 1, "ご飯1/3" => 0}.invert[amount]
	end

  def self.today
    where(created_at:  Time.now.beginning_of_day ..Time.now).order(priority: :asc)
  end

  def jp
    "#{menu.name}の#{amount_jp}、#{options.map{|option| option.option_jp}}"
  end

  def self.today_soup
  	today.
  	  where(priority: 0).
  	  map{|order|order.options}.flatten.
  	  map{|option| option.option_jp}.
  	  select{|option| ["豚汁", "みそ汁"].include?(option)}
  end

	def option_creater(ary)
  	if ary.present?
	  	ary.each do |option|
	  		self.options.create!(option: option.to_i)
		  end
		end
	end
end

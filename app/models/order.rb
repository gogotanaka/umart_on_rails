class Order < ActiveRecord::Base
	belongs_to :user
	belongs_to :menu
	has_many :options

	def amount_jp
		{"特盛" => 4, "大盛り" => 3, "普通" => 2, "少なめ" => 1, "ご飯1/3" => 0}.invert[amount]
	end

	def option_jp
		# {"おかかごはん" => 3, "めんたいごはん" => 4}.invert[amount]
	end

	def option_creater(ary)
  	if ary.present?
	  	ary.each do |option|
	  		self.options.create!(option: option.to_i)
		  end
		end
	end
end

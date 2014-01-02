class Option < ActiveRecord::Base
	belongs_to :order

	def option_jp
		{1=>"豚汁", 2=>"みそ汁", 3=>"おかかごはん", 4=>"めんたいごはん"}[self.option]
	end
end

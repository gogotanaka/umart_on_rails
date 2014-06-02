class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu
  has_many :options

  class << self
    def today
      where(created_at:  Time.now.beginning_of_day ..Time.now).order(priority: :asc)
    end

    def today_soup
      today.
        where(priority: 0).
        map{|order|  order.options_by_option_sym(:soup)}.
        flatten.
        map(&:option)
    end
  end

  def option_remark
    if options.exists?(option_type: OPTION_CODES.index(:remark))
      options.where(option_type: OPTION_CODES.index(:remark)).first.remark
    end
  end

  def options_by_option_sym(sym)
    options.where(option_type: OPTION_CODES.index(sym))
  end

  def jp_options_by_option_sym(sym)
    if options_by_option_sym(sym).present?
      "#{options_by_option_sym(sym).map{|option| OPTION_HASH[sym][option.option]}.join(',')}"
    end
  end

  def jp_rice_amount
    RICE_AMOUNTS[amount]
  end

  def remark
    options.where(option_type: OPTION_CODES.index(:remark))
  end


  def to_jp_without_soup
    string = "#{menu.try(:name) || " *** nil *** "}の#{jp_rice_amount}"

    if jp_options_by_option_sym(:rice_option).present?
       string += jp_options_by_option_sym(:rice_option)
    end

    if option_remark
      string += ", #{option_remark}"
    end

    string
  end

  def to_jp
    string = to_jp_without_soup

    if jp_options_by_option_sym(:soup).present?
      string += ", #{jp_options_by_option_sym(:soup)}"
    end

    string
  end

  def option_creater(ary, sym)
    if ary.present?
      ary.each do |option|
        if sym == :remark
          self.options.create!(remark: option, option_type: OPTION_CODES.index(sym) )
        else
          self.options.create!(option: option, option_type: OPTION_CODES.index(sym) )
        end
      end
    end
  end
end

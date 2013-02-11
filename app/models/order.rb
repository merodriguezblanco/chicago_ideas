class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :member_type

  attr_accessor :name_on_card, :email, :address, :city, :state, :card_number,
                :expiry_month, :expiry_year, :cvc, :zip, :username, :password

  accepts_nested_attributes_for :user
end
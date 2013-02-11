class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :member_type

  attr_accessor :name_on_card, :email, :address, :city, :state, :card_number,
                :expiry_month, :expiry_year, :cvc, :zip, :password


  validates_presence_of :name_on_card
  validates_presence_of :email
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :card_number
  validates_presence_of :zip
  validates_presence_of :username
  validates_presence_of :password

  validates :expiry_year, :presence => true, :length => { :is => 2 }
  validates :expiry_month, :presence => true, :length => { :is => 2 }
  validates :cvc, :presence => true, :length => { :is => 3 }


end
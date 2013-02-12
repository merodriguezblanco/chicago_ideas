require 'authorize_net'
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

  def process_transaction
    transaction = AuthorizeNet::AIM::Transaction.new(AUTHNET_LOGIN, AUTHNET_KEY, :gateway => AUTHNET_ENV)
    credit_card = AuthorizeNet::CreditCard.new(card_number, expiry_date)
    response = transaction.purchase(member_type.price, credit_card)

    return response.success?
  end

  def expiry_date
    "#{expiry_month}#{expiry_year}"
  end

  def create_member
    user = User.find_or_create_by_email(self.email, :password => self.password)
  end
end

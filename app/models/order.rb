require 'authorize_net'
class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :member_type

  attr_accessor :name_on_card, :email, :address, :city, :state, :card_number,
                :expiry_date, :cvc, :zip, :password


  validates_presence_of :name_on_card
  validates_presence_of :email # TODO: add format validation
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :card_number
  validates_presence_of :zip
  #validates_presence_of :password # TODO: add format validation

  validates :expiry_date, :presence => true, :length => { :is => 4 }, :numericality => true
  validates :cvc, :presence => true, :length => { :is => 3 }, :numericality => true

  def process_transaction
    if self.valid?
      transaction = AuthorizeNet::AIM::Transaction.new(AUTHNET_LOGIN,
                                                       AUTHNET_KEY,
                                                       :gateway => AUTHNET_ENV)
      credit_card = AuthorizeNet::CreditCard.new(card_number, expiry_date)

      response = transaction.purchase(member_type.price, credit_card)
      if response.success?
        # TODO: Serialize
        save
        return true
      else
        errors.add(:base, "There was a problem processing your credit card.")
        return false
      end
    end
    false
  end
end

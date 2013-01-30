class SimulateUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :user_id

  belongs_to :user

  before_validation :generate_password

  private
  def generate_password
    self.password = SecureRandom.hex(6)
    self.password_confirmation = self.password
  end

end


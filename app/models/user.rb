class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :prediction

  def is_admin?
    return self.role.equal?(1)
  end
  
  def has_prediction?
    return !self.prediction.equal?(nil)
  end
  
  def prediction_is_confirmed?
    return self.prediction && self.prediction.confirmed
  end
end
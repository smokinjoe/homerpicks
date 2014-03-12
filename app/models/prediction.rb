class Prediction < ActiveRecord::Base
  belongs_to :user
  
  #validate :check_confirmed
  #def check_confirmed
  #  if params
  #errors.add(:base, 'error message')
  #end
  
end

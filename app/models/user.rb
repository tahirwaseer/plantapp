class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :plants

  # check to see if a user is active or not and deny login if not
 def active_for_authentication?
   super && effective_start_date.present? && effective_start_date.to_time.to_i <= Time.now.to_i && Time.now.to_i <= effective_end_date.present? && effective_end_date.to_time.to_i 
 end
end

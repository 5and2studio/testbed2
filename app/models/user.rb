class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  
  has_and_belongs_to_many :user_groups
  has_many :permissions, -> { distinct }, through: :user_groups
end

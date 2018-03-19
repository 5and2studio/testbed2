class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  
  has_and_belongs_to_many :user_groups
  has_many :permissions, -> { distinct }, through: :user_groups

  def full_name
    # put a real method here to format the user's name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    #replace this with paperclip or other functions later
    "/assets/user2-160x160.jpg"
  end
end

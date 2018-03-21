class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable
  
  has_and_belongs_to_many :user_groups
  has_many :permissions, -> { distinct }, through: :user_groups
  belongs_to :created_by, class_name: "User", optional: true
  belongs_to :updated_by, class_name: "User", optional: true

  SYSTEM_USER_ID = 0

  def self.current
    Thread.current[:user]
  end
 
  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.system_user
    u = find_or_create_by(id: SYSTEM_USER_ID) do |user|
      user.first_name = 'System'
      user.last_name = 'User'
      user.email = 'system_user@test.com'
      user.password = 'system_user'
      user.confirmed_at = DateTime.current
      user.created_by_id = 0
    end
    puts u.errors.full_messages.to_sentence
    u
  end

  def full_name
    # put a real method here to format the user's name
    "#{first_name} #{last_name}"
  end

  def avatar_url
    #replace this with paperclip or other functions later
    "/assets/user2-160x160.jpg"
  end
end

class Permission < ApplicationRecord
  has_and_belongs_to_many :user_groups
  has_many :users, -> { distinct }, through: :user_groups
end

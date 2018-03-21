class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_save :set_created_by

  def set_created_by
    current_user_id = (User.current.present? ? User.current.id : User::SYSTEM_USER_ID)

    self.created_by_id = current_user_id if !persisted? && self.respond_to?(:created_by_id)
    self.updated_by_id = current_user_id if self.respond_to?(:updated_by_id)
  end
end

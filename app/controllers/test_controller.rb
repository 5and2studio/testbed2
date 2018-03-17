class TestController < ProtectedController
  def test
    Rails.logger.info "checking edit user: #{can? :edit, current_user }"
    Rails.logger.info "checking edit ability: #{can? :edit, Ability }"
    Rails.logger.info "checking read user: #{can? :read, User}"
  end

  def guarded
    Rails.logger.info "check verb noun: #{can? :verb, :noun}"
    unauthorized! if cannot? :verb, :noun
  end
end

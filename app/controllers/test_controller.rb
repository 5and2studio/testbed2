class TestController < ProtectedController
  def test
    Rails.logger.info "checking edit user: #{can? :edit, User}"
    Rails.logger.info "checking read user: #{can? :read, User}"
  end
end

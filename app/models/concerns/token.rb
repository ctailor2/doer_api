module Token
  extend ActiveSupport::Concern

  included do
    before_create :generate_unique_secure_token

    private

    def generate_unique_secure_token
      self.token = SecureRandom.urlsafe_base64(24)
    end
  end
end


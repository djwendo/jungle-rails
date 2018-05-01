class User < ActiveRecord::Base
  has_secure_password
  before_validation :downcase_email
  before_validation :strip_whitespace

  has_many :reviews

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: {minimum: 6}

  def authenticate_with_credentials(email, password)
    user.password = password
    user.email = email
    if user.password.valid? && user.email.valid?
      User.new(email: user.email, password: user.password)
    else
      nil
    end
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end

  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end

end

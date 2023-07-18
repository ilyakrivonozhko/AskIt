class User < ApplicationRecord
  has_secure_password validations: false
  validates :password, confirmation: true, allow_blank: true
  validate :password_complexity
  attr_accessor :old_password
  validates :email, presence: true, uniqueness: true
  validate :password_presence
  validate :correct_old_password, on: :update, if -> { password.present? }

  private

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,70}$/
    errors.add :password, 'complexity requirement not met. Length should be 8-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
  
  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)
    errors.add :old_password, "is incorrect"
  end
end
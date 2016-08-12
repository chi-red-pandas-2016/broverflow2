class User < ActiveRecord::Base
  has_many :questions
  has_many :comments
  has_many :votes
  has_many :answers

  validates_presence_of :email, :hashed_password, :username
  validates_uniqueness_of :email, :username
  validate :password_not_blank?

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(plaintext_string)
    @input_password = plaintext_string
    @password = BCrypt::Password.create(plaintext_string)
    self.hashed_password = @password
  end

  def authenticate(user_entered_password)
    self.password == user_entered_password
  end

  private
  def password_not_blank?
    if @input_password == ""
      errors.add(:password, "can't be empty, bro!")
    end
  end

end

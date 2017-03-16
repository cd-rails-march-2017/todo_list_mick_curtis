class User < ActiveRecord::Base
  has_many :tasks
  validates :username, :password, presence: true, length: {minimum: 6}
  validates :username, uniqueness: true
  validates :password, confirmation: true

  def self.login username, password
    if User.exists?(:username => username)
      user = User.find_by_username(username)
      if user.password == password
        return user
      end
    end
    return nil
  end
end

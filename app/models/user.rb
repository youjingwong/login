class User < ActiveRecord::Base
  # Remember to create a migration!
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness:  { case_sensitive: false }
  validates :username, uniqueness: {case_sensitive: false}, length: { minimum: 5 }

  def self.authenticate(email, password)
    account = self.where(email: email)
    p "-----> #{account}"
    p "-> #{email}"
    if account.count != 0
      if account[0].password == password
        return account[0]
      end
    end
    return nil
  end


end

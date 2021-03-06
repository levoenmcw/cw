class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  before_create :create_remember_token

  #validates :user_name, presence: true, length: {maximum: 50 }

  #validates :email, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i 
  #validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

has_secure_password
validates :password, length: {minimum: 6}

def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end


def User.from_omniauth(auth)
where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
user.provider = auth.provider
user.uid = auth.uid
user.name = auth.name
user.user_name = auth.name
user.email = auth.email
user.password = "berry455"
user.oath_expires_at = Time.at(auth.credentials.expires_at)
user.save!
end
end

####
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable

#has_many :refilcards
#validates :first_name, presence: true, length: {maximum: 50}
#validates :last_name, presence: true, length: {maximum: 50}

#before_save {self.email = email.downcase}
#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i 
#validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

#has_secure_password
#validates :password, length: {minimum: 6}


end

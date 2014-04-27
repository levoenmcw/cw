class User < ActiveRecord::Base

  validates (:name, presence: true, length: {maximum: 50 })

  validates (:email, presence: true)
  
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

has_secure_password
validates :password, length: {minimum: 6}

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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :rememberable,:recoverable, :trackable, :validatable
  validates :username, uniqueness: true,
                           format: { with: /\A[a-zA-Z0-9]+\z/, message: "username can only contain letters or numbers without spaces."}
  validates_presence_of :email

  has_many :memberships
  has_many :groups, through: :memberships

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where("username = :value OR lower(email) = lower(:value)", value: login ).first
    else
      where(conditions).first
    end
  end
end

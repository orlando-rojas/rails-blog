class User < ApplicationRecord
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :articles
end

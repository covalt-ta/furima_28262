class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
    validates :birthday

    with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i } do
      validates :password
      validates :password_confirmation
    end

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end

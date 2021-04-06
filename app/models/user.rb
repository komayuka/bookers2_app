class User < ApplicationRecord
  validates :name, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #has_many :relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #has_many :followers, through: :reverse_of_relationships, source: :follower
  #has_many :followings, through: :relationships, source: :follower

  has_many :relationships,class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships,class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :followings, through: :relationships,source: :followed
  has_many :followers, through: :passive_relationships,source: :follower



  def follow(user_id)
    unless self == user_id
     self.relationships.find_or_create_by(followed_id: user_id.to_i,follower_id: self.id)
    end
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end


end

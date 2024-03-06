class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
  
       has_many :likes, dependent: :destroy
       has_many :liked_apples, through: :likes, source: :apple
       has_many :apples, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  mount_uploader :image, ImageUploader
  def already_liked?(apple)
    self.likes.exists?(apple_id: apple.id)
  end
end
class Post < ApplicationRecord

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :favorites, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  def favorited_by(user)
    # user_idとpost_idが一致するlikeを検索する
    Favorite.find_by(user_id: user.id, post_id: id)
  end
end

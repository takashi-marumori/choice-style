class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :clothes
  belongs_to :season
  belongs_to :gender

  with_options presence: {message: 'を選択してください'} do
    validates :images
    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :clothes_id
      validates :season_id
      validates :gender_id
    end
  end
end

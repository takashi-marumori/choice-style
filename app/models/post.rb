class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :clothe
  belongs_to :season
  belongs_to :gender

  with_options presence: true do
    validates :images
    with_options numericality: { other_than: 1 } do
      validates :clothes_id
      validates :season_id
      validates :gender_id
    end
  end
end

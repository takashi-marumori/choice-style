class Clothes < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '帽子' },
    { id: 3, name: 'トップス' },
    { id: 4, name: 'アウター/ジャケット' },
    { id: 5, name: 'スーツ' },
    { id: 6, name: 'ワンピース/ドレス' },
    { id: 7, name: 'ボトムス' },
    { id: 8, name: 'スカート' },
    { id: 9, name: 'オールインワン' },
    { id: 10, name: 'ソックス' },
    { id: 11, name: 'シューズ' }
  ]

  include ActiveHash::Associations
  has_many :posts
end

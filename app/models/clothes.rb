class Clothes < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '帽子' },
    { id: 3, name: '上着' },
    { id: 4, name: 'ズボン' },
    { id: 5, name: '靴下' },
    { id: 6, name: '靴' },
  ]

  include ActiveHash::Associations
  has_many :posts
  end
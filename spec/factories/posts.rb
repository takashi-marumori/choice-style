FactoryBot.define do
  factory :post do
    clothes_id  { '2' }
    season_id   { '2' }
    gender_id   { '2' }
    memo        { 'test'}
    association :user

    after(:build) do |message|
      message.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end

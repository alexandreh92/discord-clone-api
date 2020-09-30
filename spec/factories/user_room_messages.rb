FactoryBot.define do
  factory :user_room_message do
    content { "MyText" }
    user { nil }
    room { nil }
  end
end

FactoryBot.define do
  factory :user do
    provider "google"
    uid "123456"
    name "Mr. Krabs"
    email "krustykrab@email.com"
    image "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0HolH2WYC47HAfaO0wlNMJT-t6WD8L7EUwzcogJh_1gmJ5ZwUZA"
    token "abcdef12345"
    refresh_token "12345abcdef"
    expires_at "2017-11-02 15:37:40"
  end
end

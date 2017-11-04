FactoryBot.define do
  factory :project do
    sequence :name do |n|
      "Renovation #{n}"
    end
    street "1234 Street Blvd"
    city "Disneyland"
    state "CA"
    zip 12345
  end
end

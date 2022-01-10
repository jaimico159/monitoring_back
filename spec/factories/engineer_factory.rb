FactoryBot.define do
  factory :engineer do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    display_name { "#{first_name} #{last_name[0]}." }
  end
end

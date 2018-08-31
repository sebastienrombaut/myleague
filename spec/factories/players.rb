FactoryBot.define do
  factory :player do
    association :league, factory: :league
    name { 'name' }
  end
end

FactoryBot.define do
  factory :purchase_destination do
    post_code { '000-0000' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '東京都' }
    address { '千代田区1-1' }
    apartment { '千代田アパート101' }
    tel { '1234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

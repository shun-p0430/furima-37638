FactoryBot.define do
  factory :user do
    nickname {'furima太郎'}
    email {'test@test'}
    password {'test0000'}
    password_confirmation {password}
    first_name {'陸太郎'}
    last_name {'山田'}
    first_name_ruby {'リクタロウ'}
    last_name_ruby {'ヤマダ'}
    birthday {'1930-01-01'}
  end
end

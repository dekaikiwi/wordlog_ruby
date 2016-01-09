FactoryGirl.define do
  factory :word do
    word {FFake::Lorem.word}
    translation {FFake::LoremCN.sentence}
    user_id "1"
  end

end

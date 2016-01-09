FactoryGirl.define do
  factory :word do
    target_word {FFaker::Lorem.word}
    translation {FFaker::LoremCN.sentence}

    user
  end

end

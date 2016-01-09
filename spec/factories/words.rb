FactoryGirl.define do
  factory :word do
    target_word {FFaker::Lorem.word}
    translation {FFaker::LoremCN.sentence}
    user
  end

  factory :word_with_lists, :parent => :word do
    lists {[FactoryGirl.create(:list)]}
  end

end

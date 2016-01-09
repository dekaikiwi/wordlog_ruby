FactoryGirl.define do
  factory :word do
    target_word {FFaker::Lorem.word}
    translation {FFaker::LoremCN.sentence}


    user
  end

  factory :word_with_lists, :parent => :word do
    ignore do
      lists {[FactoryGirl.create(:list)]}
    end

    after_create do |word, evaluator|
      word.lists << evaluator.list
    end
  end

end

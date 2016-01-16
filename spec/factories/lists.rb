FactoryGirl.define do
  factory :list do
    title {FFaker::Lorem.sentence}

    user
  end

  factory :list_with_words, :parent => :list do

    ignore do
      words {[FactoryGirl.create(:word)]}
    end

    after_create do |list, evaluator|
      list.words << evaluator.word
    end
  end

end

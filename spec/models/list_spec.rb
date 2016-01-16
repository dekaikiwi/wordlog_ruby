require 'spec_helper'

describe List do
  let (:list) { FactoryGirl.build :list}
  subject {list}

  it {should respond_to(:title)}

  it {should belong_to :user}
  it {should have_and_belong_to_many :words}
end

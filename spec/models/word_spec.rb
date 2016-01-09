require 'spec_helper'

describe Word do
  let(:word) { FactoryGirl.build :word}
  subject { word }

  it { should respond_to(:target_word)}
  it { should respond_to(:translation) }
  it { should respond_to(:user_id)}

  it { should belong_to :user }

  it { should have_and_belong_to_many :lists }
end

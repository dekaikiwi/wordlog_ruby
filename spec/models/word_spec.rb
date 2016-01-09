require 'spec_helper'

describe Word do
  let(:word) { FactoryGirl.build :word}
  subject { word }

  it { should respond_to(:word)}
  it { should respond_to(:translation) }
  it { should respond_to(:user_id)}
end

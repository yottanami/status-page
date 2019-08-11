require "spec_helper"

RSpec.describe Status::Page::Service do
  subject { described_class.new }


  describe "#pull" do
    context "pull result should be an array" do
      it { expect(subject.pull).to be_a Array }
    end

    context "pull result should not be empty" do
      it { expect(subject.pull.count.to_i).to eq 2 }
    end
  end
end

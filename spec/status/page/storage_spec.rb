require "spec_helper"

RSpec.describe Status::Page::Storage do

  before do
      new_file = File.new("data/storage_test.csv", "w")
      new_file.close
  end

    after       { File.delete("data/storage_test.csv") if File.exist?("data/storage_test.csv")  }
    subject     { described_class.new }

    describe "#save" do
      context "save data to storage" do
        let(:data) { [["Bitbucket", "Up",Time.now.to_i,Time.now.to_i, "All Systems Operational"]] }
        it { expect(subject.save(data)).to be_a(Array) }
        it { expect(subject.save(data).size).to eq 1 }
      end
    end

    describe "#read_all" do
      it "read all lines from storage" do
        expect(subject.read_all).to be_a(Array)
      end
    end

    describe "#backup" do
      after { subject.backup("backup") }
      it "should create a backup copy in a given path" do
        expect(FileUtils).to receive(:cp).with(anything, /backup/)
      end
    end

  end

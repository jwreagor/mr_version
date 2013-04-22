require 'pathname'
$:.unshift Pathname(__FILE__).dirname.expand_path.to_s
require 'spec_base.rb'

describe MrVersion::Version do

  def number(num)
    MrVersion::Number.new num
  end

  it "defaults to \"0.0.0\"" do
    MrVersion::Version.new.should.equal '0.0.0'
  end

  describe 'for "1.2.3"' do
    before do
      @version = MrVersion::Version.new '1.2.3'
    end

    it 'has a major number of "1"' do
      @version.major.should.equal number(1)
    end

    it 'has a minor number of "2"' do
      @version.minor.should.equal number(2)
    end

    it 'has a patch number of "3"' do
      @version.patch.should.equal number(3)
    end
  end

  describe "changing format" do
    before do
      @version = MrVersion::Version.new '12.0-0.1'
    end

    it "has a default format" do
      @version.format.should.equal MrVersion::Version::FORMAT
    end

    it "has a custom format" do
      @version.format = format = /^(?<dude>[0-9]*)\.0\-0\.(?<rug>[0-9]*)$/
      @version.dude.should.equal number(12)
      @version.rug.should.equal number(1)
    end
  end

end

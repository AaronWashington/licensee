require 'helper'

class TestLicenseeExactMatcher < Minitest::Test

  def setup
    text = File.open(Licensee::Licenses.find("mit").path).read.split("---").last
    blob = FakeBlob.new(text)
    @mit = Licensee::LicenseFile.new(blob)
  end

  should "match the license" do
    assert_equal "mit", Licensee::ExactMatcher.match(@mit).name
  end

  should "know the match confidence" do
    assert_equal 100, Licensee::ExactMatcher.new(@mit).confidence
  end

  should "know the matches" do
    assert_equal 1, Licensee::ExactMatcher.new(@mit).matches.size
  end
end

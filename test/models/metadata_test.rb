require "test_helper"

class MetadataTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "Hello", Metadata.new("<title>Hello</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata.new.title
  end

  test "description attribute" do
    assert_equal "Hello", Metadata.new("<meta name='description' content='Hello'>").description
  end

  test "missing description attribute" do
    assert_nil Metadata.new.description
  end

  test "image attribute" do
    assert_equal "image.png", Metadata.new("<meta property='og:image' content='image.png'>").image
  end

  test "missing image attribute" do
    assert_nil Metadata.new.image
  end
end

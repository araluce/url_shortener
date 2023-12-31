require "test_helper"

class Metadata::LinkTest < ActiveSupport::TestCase
  test "title attribute" do
    assert_equal "Hello", Metadata::Link.new("<title>Hello</title>").title
  end

  test "missing title attribute" do
    assert_nil Metadata::Link.new.title
  end

  test "description attribute" do
    assert_equal "Hello", Metadata::Link.new("<meta name='description' content='Hello'>").description
  end

  test "missing description attribute" do
    assert_nil Metadata::Link.new.description
  end

  test "image attribute" do
    assert_equal "image.png", Metadata::Link.new("<meta property='og:image' content='image.png'>").image
  end

  test "missing image attribute" do
    assert_nil Metadata::Link.new.image
  end
end

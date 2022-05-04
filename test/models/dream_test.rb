require "test_helper"

class DreamTest < ActiveSupport::TestCase
  # test "should save dream" do
  #   dream = Dream.new()
  #   dream.title = "Rails Nightmare"
  #   dream.nightmare = true
  #   dream.notes = "This is a nightmare"
  #   dream.save

  #   expected_dream = Dream.find(dream.id)
  #   assert_equal(expected_dream.title, dream.title)
  #   assert_equal(expected_dream.nightmare, dream.ngihtmare)
  #   assert_equal(expected_dream.notes, dream.notes)
  # end

  test "is a nightmare when true" do
    nightmare_dream = dreams(:one)
    assert_equal(nightmare_dream.get_dream_status(),"nightmare")
  end
end

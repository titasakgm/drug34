require 'test_helper'

class HospitalTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Hospital.new.valid?
  end
end

require 'rails_helper'

RSpec.describe Apply, type: :model do
  describe "Relations" do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end

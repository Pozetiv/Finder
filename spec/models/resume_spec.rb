require 'rails_helper'

RSpec.describe Resume, type: :model do
  describe "Relations" do
    it { should have_many(:educations) }
    it { should have_many(:career_summaries) }
    it { should belong_to(:user) }
  end
end

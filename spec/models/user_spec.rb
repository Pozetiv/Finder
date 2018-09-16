require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relations" do
    it { should have_many(:posts) }
    it { should have_many(:applies) }
    it { should have_many(:comments) }
    it { should have_one(:resume) }
  end
end

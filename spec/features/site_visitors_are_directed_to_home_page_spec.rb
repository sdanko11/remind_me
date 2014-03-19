require 'spec_helper'

    describe 'As a site visitor I want to learn more about the product' do

    # ACCEPTANCE CRITERIA
    # must have a general description of what the product or service does
    # must have a link to sign up

    it "should have a link to sign up" do

      visit root_path
      expect(page).to have_link "Sign Up"

    end

    it " should have a general description of the service" do

      visit root_path
      expect(page).to have_content "Place holder for the how it works"
      
    end

end
require 'spec_helper'

    describe 'As a site visitor I want to sign up for remind me, so I do not forget about what I have to do' do

    # ACCEPTANCE CRITERIA
    # must have a link to sign up when a user visits the homes page
    # the sign up form must have an option for email, password, password conformation, name, and phone number
    # after the user signs up they should be redirect back to the home page

    it "should lead to the sign up form" do

      visit root_path
      click_link "Sign Up"

      expect(page).to have_content "Sign up"
      expect(page).to have_field('Email')
      expect(page).to have_field('Password')
      expect(page).to have_field('Password confirmation')
      expect(page).to have_field('Name')
      expect(page).to have_field('Phone number')
      expect(page).to have_button 'Sign up'

    end

    it "should sign the user up if they fill in all fields correctly" do

      visit root_path
      click_link "Sign Up"

      fill_in 'Email', with: 'stevedanko1@gmail.com'
      fill_in 'Password', with: "hello111"
      fill_in 'Password confirmation', with: "hello111"
      fill_in 'Name', with: "Steve"
      fill_in 'Phone number', with: '4122321234'
      click_button 'Sign up'

      expect(User.count).to eql(1)
      expect(page).to have_link('Sign out')

    end

    it "should not sign the user up if they do not enter a valid email" do

      visit root_path
      click_link "Sign Up"

      fill_in 'Email', with: 'steveda'
      fill_in 'Password', with: "hello111"
      fill_in 'Password confirmation', with: "hello111"
      fill_in 'Name', with: "Steve"
      fill_in 'Phone number', with: '4122321234'
      click_button 'Sign up'

      expect(User.count).to eql(0)
      expect(page).to have_content('email is invalid please add a valid email')
         
    end

    it "should not let a user sign up if they enter a email that is already taken" do

      user = FactoryGirl.create(:user)
      visit root_path
      click_link "Sign Up"

      fill_in 'Email', with: user.email
      fill_in 'Password', with: "hello111"
      fill_in 'Password confirmation', with: "hello111"
      fill_in 'Name', with: "Steve"
      fill_in 'Phone number', with: "4128277777"
      click_button 'Sign up'

      expect(page).to have_content('email is already taken')
         
    end

    it "should not sign the user up if they do not enter a valid phone number" do

      visit root_path
      click_link "Sign Up"

      fill_in 'Email', with: 'stevedanko1@gmail.com'
      fill_in 'Password', with: "hello111"
      fill_in 'Password confirmation', with: "hello111"
      fill_in 'Name', with: "Steve"
      fill_in 'Phone number', with: '41223'
      click_button 'Sign up'

      expect(User.count).to eql(0)
      expect(page).to have_content('Only 10 digit phone numbers with no dashes will be accepted')
         
    end

    it "should not sign the user up if they try to sign up with phone number that is already used by another user" do

      user = FactoryGirl.create(:user)
      visit root_path
      click_link "Sign Up"

      fill_in 'Email', with: 'steve@aol.com'
      fill_in 'Password', with: "hello111"
      fill_in 'Password confirmation', with: "hello111"
      fill_in 'Name', with: "Steve"
      fill_in 'Phone number', with: user.phone_number
      click_button 'Sign up'

      expect(page).to have_content('has already been taken')
         
    end

    it "should not sign the user up if the password and password confirmation do not match" do

      visit root_path
      click_link "Sign Up"

      fill_in 'Email', with: 'steve@aol.com'
      fill_in 'Password', with: "1234567890"
      fill_in 'Password confirmation', with: "123456789"
      fill_in 'Name', with: "Steve"
      fill_in 'Phone number', with: '1234567890'
      click_button 'Sign up'

      expect(page).to have_content("doesn't match Password")
         
    end

end
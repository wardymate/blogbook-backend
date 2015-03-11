require 'spec_helper'

require_relative 'helpers/session'
include SessionHelpers

feature "User signs up" do

  scenario "as a new user visiting the site" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, Marissa Mayer")
  end

  scenario "with unmatching passwords" do
    expect{ sign_up("Marissa Mayer",
                    "MarissaM",
                    "marissa@example.com",
                    "pass",
                    "wrong") }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Sorry, your passwords don't match")
  end

  scenario "with an email and/or username that is already registered" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.to change(User, :count).by(0)
    expect(page).to have_content("Email is already taken" || "Username is already taken")
  end

end


feature "User signs in" do

  before(:each) do
    User.create(:name => "Marissa Mayer",
                :username => "MarissaM",
                :email => "marissa@example.com",
                :password => "yahoo!",
                :password_confirmation => "yahoo!")
  end

  scenario "with correct credentials" do
    visit ('/')
    expect(page).not_to have_content("Welcome, Marissa Mayer")
    sign_in('MarissaM', 'yahoo!')
    expect(page).to have_content("Welcome, Marissa Mayer")
  end

  scenario "with incorrect credentials" do
    visit ('/')
    expect(page).not_to have_content("Welcome, Marissa Mayer")
    sign_in('yahoo!', 'wrong')
    expect(page).not_to have_content("Welcome, Marissa Mayer")
  end

end

feature "User signs out" do

  before(:each) do
    User.create(:name => "Marissa Mayer",
                :username => "MarissaM",
                :email => "marissa@example.com",
                :password => "yahoo!",
                :password_confirmation => "yahoo!")
  end

  scenario "while being signed in" do
    sign_in('MarissaM', 'yahoo!')
    click_button "Sign out"
    expect(page).to have_content("Good bye!")
    expect(page).not_to have_content("Welcome, Marissa Mayer")
  end

end
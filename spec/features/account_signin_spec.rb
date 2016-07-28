require 'web_helper'
require './app/models/user.rb'

feature 'users can signin' do

  # scenario 'the user count increases with a new user' do
  #   expect{ sign_up }.to change(User, :count).by(1)
  # end

  scenario 'expect page to have user name' do
    expect(page).to have_content('Welcome, TC@makers.academy.com')
  end

  scenario 'expect correct email' do
    expect(User.first.email).to eq('TC@makers.academy.com')
  end
end

require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'users can signin' do

  scenario 'user signs up' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(User.first.email).to eq('TC@makers.academy.com')
    expect(page).to have_content('Welcome, TC@makers.academy.com')
  end

  scenario 'confirmation password does not match password' do
    bad_sign_up
    expect(page).to have_content('Password and confirmation password do not match')
    expect(route).to eq('/users')
  end
end

require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'users can signin' do

  scenario 'user signs up' do
    # expect{sign_up}.to change(User, :count).by(1)
    sign_up
    expect(User.first.email).to eq('TC@makers.academy.com')
    expect(page).to have_content('Welcome, TC@makers.academy.com')
  end
end

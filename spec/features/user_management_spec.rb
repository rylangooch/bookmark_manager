require 'spec_helper'
require 'web_helper'
require './app/models/user.rb'

feature 'User sign in' do
  scenario 'requires a matching confirmation password' do
    expect{ sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)

  end

end

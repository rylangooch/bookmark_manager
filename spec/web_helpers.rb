def sign_up
  visit '/user/new'
  fill_in :email, :with => 'user@user.com'
  fill_in :password, :with => 'user'
  fill_in :password_confirmation, :with => 'user'
  click_button 'Save user'
end

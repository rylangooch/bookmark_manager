def sign_up
  visit '/user/new'
  fill_in 'email', :with => 'aga@aga.com'
  fill_in 'password', :with => 'aga'
  click_button 'Save user'
end

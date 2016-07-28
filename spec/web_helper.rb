def sign_up
  visit '/user/new'
  expect(page.status_code).to eq(200)
  fill_in :email,  with: 'TC@makers.academy.com'
  fill_in :password, with: 'kiwi'
  click_button 'Sign up'
end

feature 'creating new user' do
  scenario 'storing a user profile' do
    sign_up
    expect(page).to have_content 'Welcome, user@user.com'
    expect(User.first.email).to eq('user@user.com')
  end
end

feature 'user sign up' do
  scenario 'user enters mismatching passwords' do
    expect { register(confirm_password: 'wrong') }.not_to change(User, :count)
  end

  def register(email: 'user@user.com', password: 'user', confirm_password: 'user')
    visit '/user/new'
    fill_in 'email', :with => email
    fill_in 'password', :with => password
    fill_in 'confirm_password', :with => confirm_password
    click_button 'Save user'
  end
end

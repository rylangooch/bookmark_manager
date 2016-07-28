feature 'creating new user' do
  scenario 'storing a user profile' do
    expect { sign_up }.to change(User, :count).by(1)
    p page
    expect(page).to have_content 'Welcome, aga@aga.com'

    expect(User.first.email).to eq('aga@aga.com')
  end
end

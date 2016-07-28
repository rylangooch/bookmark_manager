feature 'User sign in' do

  scenario 'requires a matching confirmation password' do

    expect { sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)

  end
    def sign_up(email: 'TC@makers.academy.com', password: 'kiwi', password_confirmation: 'kiwi')
      visit '/user/new'
      expect(page.status_code).to eq(200)
      fill_in :email,  with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
    end
end

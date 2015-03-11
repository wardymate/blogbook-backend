module SessionHelpers

  def sign_up(name = "Marissa Mayer",
              username = "MarissaM",
              email = "marissa@example.com",
              password = "yahoo!",
              password_confirmation = "yahoo!")
    visit '/users/new'
    fill_in :name, :with => name
    fill_in :username, :with => username
    fill_in :email, :with => email
    fill_in :password, :with => password
    fill_in :password_confirmation, :with => password_confirmation
    click_button "Sign up"
  end

  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', :with => username
    fill_in 'password', :with => password
    click_button 'Sign in'
  end

  def sign_out
    click_button "Sign out"
  end

  def add_blog(url, tags)
    within('#new-blog') do
      fill_in 'url', :with => url
      fill_in 'tags', :with => tags.join(' ')
      click_button 'Add blog'
    end
  end

end
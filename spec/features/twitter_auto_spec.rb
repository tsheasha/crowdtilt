describe "access Twitter API and get correct response", :js => true do
  
  it "Gets common friends of two Twitter Users" do
    visit '/'
    within("#common_friends") do
      fill_in 'first_username', :with => 'yahiaelgamal'
      fill_in 'second_username', :with => 'Trustious'
    end
    click_button 'Get Common Friends'
    expect(page).to have_content 'Yusuf Saber'
  end
  
  it "Returns empty message for users with no common friends" do
    visit '/'
    within("#common_friends") do
      fill_in 'first_username', :with => 'yahiaelgamal'
      fill_in 'second_username', :with => 'TarekSheashaaa'
    end
    click_button 'Get Common Friends'
    expect(page).to have_content 'The requested users do not have any common friends.'
  end

    it "Gets recent tweets of a Twitter User" do
    visit '/'
    within("#recent_tweets") do
      fill_in 'username', :with => 'yahiaelgamal'
    end
    click_button 'Get Recent Tweets'
    expect(page).to have_content 'Get the recent tweets of a Twitter user.'
  end
  
  it "Returns empty message for users with no recent tweets" do
    visit '/'
    within("#recent_tweets") do
      fill_in 'username', :with => 'TarekSheashaTarekSheasha'
    end
    click_button 'Get Recent Tweets'
    expect(page).to have_content 'The requested user has not tweeted lately.'
  end
end

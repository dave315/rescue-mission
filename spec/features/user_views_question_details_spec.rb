# As a user
# I want to view a question's details
# So that I can effectively understand the question
#
# Acceptance Criteria
#
# - I must be able to get to this page from the questions index
# - I must see the question's title
# - I must see the question's description

feature 'User views question details' do
  let(:new_question) { FactoryGirl.create(:question) }

  scenario 'user clicks on question' do
    new_question
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit questions_path

    click_link(new_question.title)

    expect(page).to have_content new_question.title
    expect(page).to have_content new_question.body
    expect(page).to have_content new_question.created_at
  end
end

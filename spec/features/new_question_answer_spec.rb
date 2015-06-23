# As a user
# I want to answer another user's question
# So that I can help them solve their problem
#
# Acceptance Criteria
#
# - I must be on the question detail page
# - I must provide a description that is at least 50 characters long
# - I must be presented with errors if I fill out the form incorrectly

require 'rails_helper'

feature 'User posts an answer to a question' do
  let(:question) { FactoryGirl.create(:question) }

  scenario 'User submits valid answer' do
    question
    body = "This is the answer to your question FUCKING 50 LINES LONG BITCH!"
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit "/questions/#{question.id}"



    expect(page).to have_content("Answers")
    expect(page).to have_button("Add Answer")

    fill_in "Body", with: body
    click_button("Add Answer")
save_and_open_page

    expect(page).to have_content(body)

  end
end

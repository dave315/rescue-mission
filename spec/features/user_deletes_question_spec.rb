# As a user
# I want to delete a question
# So that I can delete duplicate questions
#
# Acceptance Criteria
#
# - I must be able delete a question from the question edit page
# - I must be able delete a question from the question details page
# - All answers associated with the question must also be deleted
require 'rails_helper'

feature 'Delete question' do
  let(:question) { FactoryGirl.create(:question) }

  scenario 'User deletes question' do
    question
    user = FactoryGirl.create(:user)

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'

    visit "/questions/new"

    fill_in "Body", with: question.body
    fill_in "Title", with: question.title

    click_button("Submit")

    click_link("Delete Question")

    expect(page).to have_content("Question Deleted")
  end
end

# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page
require 'rails_helper'

feature 'Edit Question' do
  let(:question) { FactoryGirl.create(:question) }

  scenario 'User edits previously submitted question' do
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

    click_link("Edit Question")

    fill_in("Body", with: "this is an edit to the question body, blah blah blah blah")
    click_button("Submit")

    expect(page).to have_content("this is an edit to the question body, blah blah blah blah")
  end
end

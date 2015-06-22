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

    visit "/questions/#{question.id}"

    expect(page).to have_content("Answers")
    expect(page).to have_button("Add Answer")

    fill_in "Body", with: "This is the answer to your question!"
    click_button("Add Answer")


    expect(page).to have_content("This is the answer to your question!")

  end
end

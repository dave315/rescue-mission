require 'rails_helper'
# As a user
# I want to post a question
# So that I can receive help from others
#
# Acceptance Criteria
#
# - I must provide a title that is at least 40 characters long
# - I must provide a description that is at least 150 characters long
# - I must be presented with errors if I fill out the form incorrectly

feature 'User posts a question' do
  scenario 'User submits valid question' do
    visit new_question_path

    title = 'new question'
    body = 'body to new question'

    fill_in 'Title', with: title
    fill_in 'Body', with: body

    click_button 'Submit'

    expect(page).to have_content(title)
    expect(page).to have_content(body)

  end

  scenario 'User submits invalid question' do
    visit new_question_path

    body = 'body to new question'

    fill_in 'Body', with: body

    click_button 'Submit'

    expect(page).to have_content("can't be blank")

  end
end

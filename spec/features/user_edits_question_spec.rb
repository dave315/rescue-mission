# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page

feature 'Edit Question' do
  let(:new_question) { FactoryGirl.create(:question) }
  let (:user) { FactoryGirl.create(:user) }

  scenario 'User edits previously submitted question' do
    new_question
    visit "/questions/#{new_question.id}"

    click_link("Edit Question")
    save_and_open_page
    fill_in("Body", with: "this is an edit to the question body, blah blah blah blah")
    click_button("Submit")

    expect(page).to have_content("this is an edit to the question body, blah blah blah blah")
  end
end

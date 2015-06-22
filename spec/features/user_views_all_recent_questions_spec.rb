require 'rails_helper'

feature 'user views all questions', %Q{
  As a user
  See title of each question
  Listed in order, recently posted first(at top)
} do
  let(:old_question) { FactoryGirl.create(:question) }
  let(:new_question) { FactoryGirl.create(:question) }

  scenario 'User visits site to see questions' do
    old_question

    visit "/"

    expect(page).to have_content old_question.title
    expect(page).to have_content old_question.body
  end

  scenario 'User visits site to see most recent questions first' do
    old_question
    new_question

    visit "/"
    expect(page.body.index(old_question.title)).to be > page.body.index(new_question.title)

  end
end

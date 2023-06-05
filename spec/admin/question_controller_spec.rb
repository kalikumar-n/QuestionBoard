require 'rails_helper'

RSpec.describe Admin::QuestionsController, type: :feature do
  let(:admin_user) { create(:admin_user) }

  describe 'Question index page' do
    it 'should display the list of questions' do
      visit admin_questions_path
      expect(page).to have_content('when is the launch of iphone 15', wait: 5)
    end

    it 'should be able to view a question' do
      visit admin_questions_path
      first(:link, 'View').click
      expect(page).to have_content('when is the launch of iphone 15', wait: 5)
    end

    it 'should be able to edit a question' do
      visit edit_admin_question_path(1)
      fill_in 'Description', with: "Can we see laptop's with wireless charging in 2024"
      click_button 'Update Question'
      expect(page).to have_content('Question was successfully updated.', wait: 5)
    end


    it 'should be create a new question' do
      visit new_admin_question_path
      fill_in 'Description', with: "Which is the best Google IO"
      fill_in 'Title', with: "Google I/O"
      click_button 'Create Question'
      expect(page).to have_content('Question was successfully created.', wait: 5)
    end

  end
end

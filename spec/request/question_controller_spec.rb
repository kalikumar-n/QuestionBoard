require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:token) {'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJ1c2VyX2VtYWlsIjoidGVzdGluZ3NhbXBsZUBnbWFpbC5jb20iLCJleHAiOjE2ODY3OTgwNzR9.1x3xBOYkbCNYD7czhn9wmeeWOOwG07tSr-gzxHoT9ZA'}
  let(:question) {create(:question)}
  describe "GET #INDEX" do
    context 'when the user is authorized' do
      before do
        request.headers['Authorization'] = "Bearer #{token}"
        get :index
      end
      it { should respond_with(200) }
      it 'should returns all Questions' do
        expect(response.body).to include("For testing custom paths")
      end
    end

    context 'when the user is not authorized' do
      before do
        get :index
      end
      it { should respond_with(401)}
    end
  end

  describe "UPDATE" do
    it 'Should Restrict to :title, :description, :file'do
      params = {
        id: question.id,
        title: 'New title',
        description: 'Description of new title'
      }
      should permit(:title, :description).
        for(:update, params: params).
        on(:question)
    end
  end

end

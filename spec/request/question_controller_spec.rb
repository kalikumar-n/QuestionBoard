require 'rails_helper'

RSpec.describe QuestionsController, type: :request do

  describe "GET #INDEX" do
    it 'should returns all items' do
      get "/questions", headers: { 'Authorization' => "Bearer #{'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJ1c2VyX2VtYWlsIjoidGVzdHVzZXJAZ21haWwuY29tIiwiZXhwIjoxNjg2NTYxMjEzfQ.VYFtCk78Vg1rM_AQNZ8Z-cejU3SXkwS7YebgPltCYWc'}" }
      expect(response.body).to include('when will laptop’s get wireless charging')
    end
  end
end

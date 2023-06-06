class QuestionSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :title, :description
  belongs_to :user
end

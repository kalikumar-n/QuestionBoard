class QuestionMailer < ApplicationMailer

  def mail_questions(to, questions)
    @questions = questions
    mail(to: to, subject: "Your User's Questions")
  end
end

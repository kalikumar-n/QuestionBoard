class UpdateQuestionTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions ,:users_id
    add_reference :questions ,:user, foreign_key: true
  end
end

ActiveAdmin.register Question do

  menu label: 'All the Questions'
  permit_params :title, :description, :user_id
  config.per_page = 10
  index do
    selectable_column
    index_column
    column :title
    column :description
    column :user
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :user

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
    end
    f.actions
  end


  csv do
    column :title
    column :description
    column :user
  end
end

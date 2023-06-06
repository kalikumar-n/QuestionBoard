class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :email,:active, :existed_since

  has_many :questions

  attribute :active do |object|
    (object.active.eql? true)? 'Yes': 'No'
  end

  attribute :existed_since do |object|
    date = object.created_at
    month = date.strftime('%B')
    year  = date.strftime('%Y')
    "#{month}-#{year}"
  end
end

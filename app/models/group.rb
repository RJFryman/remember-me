class Group < ActiveRecord::Base
  validates :name, uniqueness: true,
                     presence: true,
                       format: { with: /[a-zA-Z]/, message: "names must contain atleast one letter."}
end

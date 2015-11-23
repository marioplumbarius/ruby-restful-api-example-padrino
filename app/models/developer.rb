class Developer < ActiveRecord::Base
  has_many :projects

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :age, presence: true, numericality: {only_integer: true, greater_than: 0}
  validates :github, presence: true, format: {with: URI.regexp}

  default_scope { order(:updated_at) }
end

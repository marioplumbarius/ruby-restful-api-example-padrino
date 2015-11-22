class Project < ActiveRecord::Base
  enum kind: { open_source: 0, proprietary: 1 }

  validates :name, presence: true
  validates :kind, inclusion: { in: Project.kinds.keys }
  validates :release_date, presence: true
end

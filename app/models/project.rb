class Project < ActiveRecord::Base
  belongs_to :developer

  enum kind: { open_source: 0, proprietary: 1 }

  validates :name, presence: true
  validates :kind, inclusion: { in: Project.kinds.keys }
  validates :release_date, presence: true
  validates :developer_id, presence: true
end

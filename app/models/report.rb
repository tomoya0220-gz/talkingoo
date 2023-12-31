class Report < ApplicationRecord
    belongs_to :reporter, class_name: 'User', foreign_key: 'reporter_id'
    belongs_to :reported, class_name: 'User', foreign_key: 'reported_id'
    belongs_to :context, polymorphic: true

    validates :reason, presence: true
end
class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :content, presence: true

  paginates_per 10

  scope :index_all, -> {
    select(:id, :content, :user_id, :created_at)
        .order(created_at: :desc)
  }
end

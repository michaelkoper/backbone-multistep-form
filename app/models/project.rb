class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name,                  type: String
  field :basic_info,            type: String
  field :story,                 type: String
  field :location,              type: String
  field :funding_duration_days, type: Integer
  field :reward,                type: Integer
  field :email,                 type: String


  belongs_to :category
  embeds_many :rewards

  validates_presence_of :name
  validates_presence_of :basic_info
  validates_presence_of :location
  validates_presence_of :funding_duration_days
  validates_presence_of :story

  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i


  ### Class methods

  class << self

    def build_for_user(params)
      Project.new(params)
    end

  end

end
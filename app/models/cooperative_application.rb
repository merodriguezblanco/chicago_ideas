class CooperativeApplication < ActiveRecord::Base

  include SearchSortPaginate

  validates :name, presence: true
  validates :title, presence: true
  validates :organization, presence: true
  validates :phone, presence: true
  validates :org_mission, presence: true
  validates :org_twitter, presence: true
  validates :reason, presence: true
  validates :worked_on, presence: true
  validates :expectations, presence: true
  validates :part_meaningful, presence: true
  validates :ins_failure, presence: true
  validates :neighborhood, presence: true
  validates :assisted_area, presence: true
  validates :passion, presence: true
  validates :recommend, presence: true

  has_attached_file :pdf, :path => "applications/cooperative/pdfs/:id/:filename"

  def self.search_fields parent_model=nil
    case parent_model.class.name.underscore
    when 'foo'
    else
      [
        { :name => :search, :as => :string, :fields => [:name], :wildcard => :both },
        { :name => :created_at, :as => :datetimerange },
      ]
    end
  end

end


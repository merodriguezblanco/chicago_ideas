class CooperativeApplication < ActiveRecord::Base

  include SearchSortPaginate

  validates :name,            presence: true
  validates :last_name,       presence: true
  validates :organization,    presence: true
  validates :phone,           presence: true
  validates :email,           presence: true, email: true
  validates :org_mission,     presence: true
  validates :org_website,     presence: true
  validates :org_twitter,     presence: true
  validates :reason,          presence: true
  validates :worked_on,       presence: true, length: { maximum: 400 }
  validates :part_meaningful, presence: true, length: { maximum: 200 }
  validates :ins_failure,     presence: true, length: { maximum: 300 }
  validates :neighborhood,    presence: true, length: { maximum: 100 }
  validates :assisted_area,   presence: true
  validates :recommend,       presence: true

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


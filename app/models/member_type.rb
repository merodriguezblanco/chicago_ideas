class MemberType < ActiveRecord::Base

  # my bone dry solution to search, sort and paginate
  include SearchSortPaginate


  # we have a polymorphic relationship with notes
  has_many :notes, :as => :asset
  has_many :members

  def price=(num)
    @price = num.to_i
  end

  def price
    return 0 if @price.nil?
    @price || price_in_cents / 100
  end

  before_save :set_price_in_cents
  def set_price_in_cents
    self.price_in_cents = price.to_i * 100 if price.to_i * 100 != price_in_cents
  end

  # the hash representing this model that is returned by the api
  def api_attributes
    {
      :id => id.to_s,
      :type => self.class.name.underscore.downcase,
      :name => name,
      :description => description
    }
  end

  # a DRY approach to searching lists of these models
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

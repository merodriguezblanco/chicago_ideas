class BhsiLongtext < ActiveRecord::Base

  include SearchSortPaginate

  belongs_to :BhsiApplication



  validates :about_yourself, :presence => true, :length => {
    :maximum   => 1000,
    :tokenizer => lambda { |str| str.scan(/\b\S+\b/) },
    :too_long  => "must be less than %{count} words"
  }
  validates :social_venture_description, :presence => true, :length => {
    :maximum   => 200,
    :tokenizer => lambda { |str| str.scan(/\b\S+\b/) },
    :too_long  => "must be less than %{count} words"
  }
  validates :venture_launched, :presence => true
  validates :number_people_affected, :presence => true
  validates :explain_number, :presence => true, :length => {
    :maximum   => 300,
    :tokenizer => lambda { |str| str.scan(/\b\S+\b/) },
    :too_long  => "must be less than %{count} words"
  }
  validates :three_standout_statistics, :presence => true, :length => {
    :maximum   => 200,
    :tokenizer => lambda { |str| str.scan(/\b\S+\b/) },
    :too_long  => "must be less than %{count} words"
  }
    validates :strong_midwest_connections_explained, :presence => true, :length => {
    :maximum   => 200,
    :tokenizer => lambda { |str| str.scan(/\b\S+\b/) },
    :too_long  => "must be less than %{count} words"
  }
  validates :organizational_development, :presence => true, :length => {
    :maximum   => 600,
    :tokenizer => lambda { |str| str.scan(/\b\S+\b/) },
    :too_long  => "must be less than %{count} words"
  }


end

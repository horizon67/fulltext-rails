class Book < ApplicationRecord
  include SearchCop

  search_scope :search do
    attributes :all => [:title, :content]

    options :all, :type => :fulltext, :default => true
  end
end

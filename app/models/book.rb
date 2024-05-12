# frozen_string_literal: true

class Book < ApplicationRecord
  include SearchCop

  search_scope :search do
    attributes all: %i[title content]

    options :all, type: :fulltext, default: true
  end
end

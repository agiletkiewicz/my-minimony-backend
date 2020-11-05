class BoardsPost < ApplicationRecord
  belongs_to :board
  belongs_to :post
end

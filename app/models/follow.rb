class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :board

  def image
    self.board.image
end

def title
    self.board.title
end
end

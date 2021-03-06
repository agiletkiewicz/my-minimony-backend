class Board < ApplicationRecord
  belongs_to :user
  has_many :boards_post, dependent: :destroy
  has_many :posts, through: :boards_post
  has_many :follows
  has_many :users, through: :follows

  validates :title, presence: true

  def image 
    if self.posts.first
      self.posts.first.get_image_url 
    else
      "https://images.unsplash.com/photo-1551554842-b37d2131aa68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    end
  end

  def image_one 
    if self.posts.first
      self.posts.first.get_image_url 
    else
      "https://images.unsplash.com/photo-1551554842-b37d2131aa68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    end
  end

  def image_two 
    if self.posts[1]
      self.posts[1].get_image_url 
    else
      "https://images.unsplash.com/photo-1551554842-b37d2131aa68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    end
  end

  def image_three 
    if self.posts[2]
      self.posts[2].get_image_url 
    else
      "https://images.unsplash.com/photo-1551554842-b37d2131aa68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    end
  end

  def image_four 
    if self.posts[3]
      self.posts[3].get_image_url 
    else
      "https://images.unsplash.com/photo-1551554842-b37d2131aa68?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
    end
  end

end

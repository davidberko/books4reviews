class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book, dependent: :destroy

  def moderated?
    !self.helpful & !self.unhelpful == false
  end

  def helpful?
    if self.helpful == true
      helpful
      print = "Moderator found review helpful"
    else
      print = "Review still under moderation"
  end
end

  def unhelpful?
    if self.unhelpful == true
      unhelpful
      print = "Moderator found review unhelpful"
    else
      helpful?
    end
  end

end

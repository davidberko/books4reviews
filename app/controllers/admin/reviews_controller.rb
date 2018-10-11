class Admin::ReviewsController < Admin::AdminController

  def index
    @adminreviews = Admin::Review.all
  end

end

module ApplicationHelper


  def user_photo(user)
    image_tag( user.photo, :width => "150", :class => "user photo" )
  end

end

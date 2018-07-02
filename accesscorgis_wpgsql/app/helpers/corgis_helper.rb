module CorgisHelper

  def corgi_author(corgi)
    user_signed_in? && current_user.id == corgi.user_id
  end

end

module UsersHelper
  # Fravatar URLs are based on MD5 Hash of the users emailt.binary :
  # We implement it in Ruby using 'hexdigest' from the Digest lib.

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt:user.name, class: "gravatar d-block", size:100)
  end

  def logged_in?
    
  end
end

module ApplicationHelper
  def flash_message(message)
    flash[:notice] = message
  end

  def flash_error(message)
    flash.now[:alert] = message
  end

  def gravatar_for(user, options = { size: 80 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(
      gravatar_url,
      alt: user.username,
      class: "rounded shadow mx-auto d-block"
    )
  end
end

module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    size = options[:size]
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag image_src, alt: user.user_name, class: "mt-4 rounded mx-auto d-block shadow"
  end

end

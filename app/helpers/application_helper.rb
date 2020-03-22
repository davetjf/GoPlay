module ApplicationHelper
  def avatar_url(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      default_url = "https://sem4project.s3-eu-west-1.amazonaws.com/assets/favicon.PNG"
      gravatar_id = Digest::MD5::hexdigest(user.email).downcase
      "http://gravatar.com/avatar/#{gravatar_id}.png?d=#{CGI.escape(default_url)}"
    end
  end
end
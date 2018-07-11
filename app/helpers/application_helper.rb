module ApplicationHelper
  def avatar_url(user)
    # user email에서 gravatar_id를 추출하고 gravatar.com에서 해당하는 이미지를 불러옴 
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=retro&s=150"
  end
end

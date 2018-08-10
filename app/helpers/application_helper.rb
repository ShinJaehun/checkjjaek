module ApplicationHelper
  def avatar_url(user)
    # user email에서 gravatar_id를 추출하고 gravatar.com에서 해당하는 이미지를 불러옴 
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=retro&s=150"
  end
  
  def book_thumbnail(url)
    # book image가 있으면 해당 url을, 없으면 no image avaliable 이미지를 리턴
    unless url.to_s.empty?
      "#{url}"
    else
      '/assets/nia.jpg'
    end
  end
end

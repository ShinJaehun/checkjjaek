module ApplicationHelper
  def avatar_url(user)
    # user email에서 gravatar_id를 추출하고 gravatar.com에서 해당하는 이미지를 불러옴 
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?d=retro&s=150"
  end
  
  def extract_thumbnail110_url(url)
    # book image가 있으면 해당 url을, 없으면 no image avaliable 이미지를 리턴
    unless url.to_s.empty?
      'http://t1.daumcdn.net/thumb/R110x0/?fname=' + URI.unescape(url.match(/http%.+/).to_s)
    else
      '/assets/nia.jpg'
    end
  end
  
  def extract_thumbnail250_url(url)
    # book image가 있으면 해당 url을, 없으면 no image avaliable 이미지를 리턴
    unless url.to_s.empty?
      'http://t1.daumcdn.net/thumb/R260x0/?fname=' + URI.unescape(url.match(/http%.+/).to_s)
    else
      '/assets/nia.jpg'
    end
  end
  
  def book_thumbnail_search(url)
    # book image가 있으면 해당 url을, 없으면 no image avaliable 이미지를 리턴
    unless url.to_s.empty?
      "#{url}"
    else
      '/assets/nia.jpg'
    end
  end
  
  def book_thumbnail150(url)
    # width가 150인 thumbnail 경로 리턴
    # 실제 사용하는 이미지의 width 200으로 좀 더 선명하게 보여줌
    # book image가 있으면 해당 url을, 없으면 no image avaliable 이미지를 리턴

    unless url.to_s.empty?
      'http://t1.daumcdn.net/thumb/R200x0/?fname=' + URI.encode(url)
    else
      '/assets/nia.jpg'
    end
  end
  
  def book_thumbnail250(url)
    # width가 150인 thumbnail 경로 리턴
    # 실제 사용하는 이미지의 width 200으로 좀 더 선명하게 보여줌
    # book image가 있으면 해당 url을, 없으면 no image avaliable 이미지를 리턴
  
    unless url.to_s.empty?
      'http://t1.daumcdn.net/thumb/R260x0/?fname=' + URI.encode(url)
    else
      '/assets/nia.jpg'
    end
  end
end

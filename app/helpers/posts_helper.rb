module PostsHelper
  def render_with_hashtags(content)
	  content.gsub(/#\s*\S*|\S*\s*/){
	    |word| 
	      if word.include? "#"
	        link_to word, "/posts/hashtag/#{word.delete('#')}"
	      else
	        word
	      end
    }.html_safe
  end
end

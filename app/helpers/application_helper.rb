# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper 
  def body_tag(map = false)
     body = map ?  "<body onload='initialize()' onunload='GUnload()'>" : "<body>"
     @content_for_body_tag = body
  end
end

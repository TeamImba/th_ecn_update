module ApplicationHelper

  def report_menu
    if @reports
      x = ""
        for report in @reports
        x += "<div>" + link_to(image_tag("/images/new.jpg", {:alt => "new", :width=> "45px"}) , new_ecndocument_path(:type => report.id)) + "<br/>" + 
          "New " + report.alias + " Doc" + 
        "</div>" 
        end
      raw x
      end
  end
  
  def display_text(text)
    text ||= ""
    raw text.gsub("\r\n", "<br/>")
  end
  
  
  
end

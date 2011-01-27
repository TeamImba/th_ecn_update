module EcndocumentsHelper

  def display_ecn_doc f
    output = ""
    if @last_signatory
      output += "<br/>"
      output += f.text_field :ecn_doc
		elsif @ecndocument.ecn_doc.blank?
			output += "<br/>Note: For DCC entry only"
    else 
      output += @ecndocument.ecn_doc
		end
    raw output
  end
  
  def display_extension(label, value)
    output = ""
    output += label
    output += '<input type="radio" disabled '
    if @ecndocument.extension.to_i == value
      output += "checked"
    end
    output += "/>"
    raw output
  end

  def display_effectivity_date(f)
    output = ""
    if @last_signatory
      if @ecndocument.effectivity_from.blank? && @ecndocument.effectivity_to.blank?
        output += "Effectivity from: "
        output += f.date_select(:effectivity_from)
        output += "<hr>" 
        output += "Effectivity to: "
        output += f.date_select(:effectivity_to)
      else 
        output += "From: "
        if @ecndocument.effectivity_from != nil
          output += @ecndocument.effectivity_from.strftime("%m/%d/%y") 
        else
          output += "Document Disapproved"
        end
        output += "<br> To: "
        if @ecndocument.effectivity_to != nil
          output += @ecndocument.effectivity_to.strftime("%m/%d/%y") 
        else
          output += "Document Disapproved"
        end
      end 
    else  
      if @ecndocument.ecn_doc.blank?
        output += "For DCC entry only"
      else 		
        output += "From: "
        if @ecndocument.effectivity_from != nil
          output += @ecndocument.effectivity_from.strftime("%m/%d/%y") 
        else
          output += "Document Disapproved"
        end
        output += "<br> To:"
        if @ecndocument.effectivity_to != nil 
          output += @ecndocument.effectivity_to.strftime("%m/%d/%y") 
        else
          output += "Document Disapproved"
        end
      end
    end 
    raw output
  end

  def review_status(reviewer, designation)
    status = reviewer.status
    user = reviewer.ecnuser
    
    output = "<td>"
    output += (reviewer.ecnuser.blank?)? "N/A" : reviewer.ecnuser.full_name
    output += "</td>"
    output += "<td>"
    
    if status.blank?
      ## NOTE: use @user here to determine that the current user is now the designated signatory
      ## make sure that not only is his/her position is the one needed, also check if he's the one assigned by originator
      if user.blank?
        output += "N/A</td><td>N/A</td><td>N/A</td>"
      elsif @user.ecnposition.id == designation && @user.id == user.id
        output += "No action taken yet"
        output += "</td><td>N/A</td><td>N/A</td>"
      else
        output += "Not yet reviewed"
        output += "</td><td>N/A</td><td>N/A</td>"
      end
    else
      if status == 0
        output += "DISAPPROVED"
      elsif status == 1
        # use local variable user to get their signature, and not the current user's
        if user && user.signature.url.index("/missing.png")
          output += "APPROVED"
        else
          output += (image_tag(user.signature.url))
        end
      else
        output += "N/A"
      end
      output += "</td><td>"
      output += reviewer.approval_timestamp.strftime("%m/%d/%y")
      output += "</td><td>"
      output += reviewer.approval_timestamp.strftime("%H:%M")
      output += "</td>"
    end
    
    raw output
  end
  
  
  def review_remark(doc_id, reviewer, designation, f )
    user = reviewer.ecnuser
    output = ""
    if user.blank?
      output += "<td>N/A</td>"
      output += "<td>N/A</td>"
      output += "<td>N/A</td>"
      output += "<td>N/A</td>"
      output += "<td>N/A</td>"
    else 
      user_done = user.ecnreview_forms.where(["ecn_id = ?", doc_id ])
      if @user.ecnposition.id == designation && @user.id == user.id
        output += "<td>"
        output += f.text_area :rem
        output += "</td>"
        output += "<td>"
        output += f.text_area :review
        output += "</td>"
        output += "<td>N/A</td>"
        output += "<td>N/A</td>"
        output += "<td>N/A</td>"    
      elsif reviewer && reviewer.status && user_done && user_done.first
        output += "<td>"
        output += user_done.first.rem
        output += "</td>"
        output += "<td>"
        output += user_done.first.review
        output += "</td>"
        output += "<td>N/A</td>"
        output += "<td>"+reviewer.approval_timestamp.strftime("%m/%d/%y %H:%M")+"</td>"
        output += "<td>"
        if user && user.signature.url.index("/missing.png")
          output += "N/A"
        else
          output += (image_tag(user.signature.url))
        end
        output += "</td>"
      else
        output += "<td>--</td>"
        output += "<td>--</td>"
        output += "<td>--</td>"
        output += "<td>--</td>"
        output += "<td>--</td>"
      end
    end
    
    raw output
  end
  
  def display_assets
    output = ""
    for asset in @ecndocument.assets
      output += "<li>"
      if asset.image.url.index("/missing.png")
        output += asset.image.file_name
      else
        output += (image_tag(asset.image.url, :width => "250px"))
      end
      output += "</li>"
    end
    raw output
  end
  
end

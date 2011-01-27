class StatusMailer < ActionMailer::Base
  default :from => "th_ecn@net.tonghsing.ph"
  
  def next_signatory_notice(next_signatory, prev_signatory, document)
    @next_signatory = next_signatory
    @prev_signatory = prev_signatory
    @document = document
    mail(
          :to => @next_signatory.email,
          :subject => "Tong Hsing Electronics - URGENT: New signature notice!"
         )
  end
  
  def disapproval_notice(disapproved_by, originator, document, remarks)
    @disapproved_by = disapproved_by
    @originator = originator
    @document = document
    @remarks = remarks
    mail(
          :to => @originator.email,
          :subject => "Tong Hsing Electronics - ECN document disapproval notice!"
         )
  end
  
  # def maturity_notice(to_notify, user_email)
		# @subject = 'Tong Hsing Electronics - ECN document maturity notice!'
		# @body = {:to_notify => to_notify, :user_email => user_email}
		# @recipients	= user_email
  # end
  
  
end

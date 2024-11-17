class PostMailer < ApplicationMailer
  def post_email
    post = params[:post]

    @title = "Message from #{post.name}"
    @reply = "Reply to #{post.address}"
    @paragraphs = post.message.split("\n").reject { |element| element.empty? }

    mail(
      to: Rails.application.credentials.email[:recipient],
      from: "\"Mailtrap 📧\" <#{Rails.application.credentials.email[:sender]}>",
      subject: "Mailtrap message from #{post.address}",
      reply_to: post.address,
    )
  end
end

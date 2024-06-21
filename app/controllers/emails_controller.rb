class EmailsController < ApplicationController

  # POST /emails/send
  def send_email
    title = "Message from #{email_params[:name]}"
    reply = "Reply to #{email_params[:address]}"
    paragraphs = email_params[:message].split("\n").reject(&:empty?)

    mail = Mailtrap::Mail::Base.new(
      from: { email: credentials.mailtrap_sender, name: 'Mailtrap 📧' },
      to: [{ email: credentials.email_recipient }],
      subject: "Mailtrap message from #{email_params[:name]}",
      text: "#{email_params[:message]}\n#{reply}",
      html: "
        <h1>#{title}</h1>
        #{paragraphs.map { |p| "<p>#{p}</p>" }.join('')}
        <h4>#{reply}</4>
      "
    )

    client = Mailtrap::Client.new(api_key: credentials.mailtrap_token, api_host: 'send.api.mailtrap.io')

    response = client.send(mail)

    render json: { id: response[:message_ids].first }, status: :ok
  end

  private

  def email_params
    params.require(:email).permit(:name, :address, :message)
  end

  def credentials
    Rails.application.credentials
  end
end

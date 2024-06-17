class EmailsController < ApplicationController

  def index
    response = { message: 'success' }
    render json: response, status: :created
  end

  # POST /emails
  def create
    api_key = "c282ddb00d4a003d89f4811f087abe03"
    api_host = "send.api.mailtrap.io"

    email_name = params.require(:name)
    email_address = params.require(:address)
    email_message = params.require(:message)

    mail = Mailtrap::Mail::Base.new(
      from: { email: "mailtrap@bmcgrath.net", name: "bmcgrath" },
      to: [{ email: "brian.joseph.mcgrath@gmail.com" }],
      subject: "Message from #{email_name} <#{email_address}>",
      text: email_message
    )

    client = Mailtrap::Client.new(api_key: api_key, api_host: api_host)

    response = client.send(mail)

    render json: response, status: :created
  end
end

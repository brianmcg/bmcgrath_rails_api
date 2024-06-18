class EmailsController < ApplicationController
  def index
    render json: { message: "success" }, status: :ok
  end

  # POST /emails
  def create
    api_key = "c282ddb00d4a003d89f4811f087abe03"
    api_host = "send.api.mailtrap.io"

    mail = Mailtrap::Mail::Base.new(
      from: { email: "mailtrap@bmcgrath.net", name: "bmcgrath" },
      to: [{ email: "brian.joseph.mcgrath@gmail.com" }],
      subject: "Message from #{email_params[:name]} <#{email_params[:address]}>",
      text: email_params[:message]
    )

    client = Mailtrap::Client.new(api_key: api_key, api_host: api_host)

    response = client.send(mail)

    render json: response, status: :created
  end

  private

  def email_params
    params.require(:email).permit(:name, :address, :message)
  end
end

class EmailsController < ApplicationController
  def index
    render json: { message: "success" }, status: :ok
  end

  # POST /emails
  def create
    mail = Mailtrap::Mail::Base.new(
      from: { email: ENV["MAILTRAP_SENDER"], name: "bmcgrath" },
      to: [{ email: ENV["EMAIL_RECIPIENT"] }],
      subject: "Message from #{email_params[:name]} <#{email_params[:address]}>",
      text: email_params[:message]
    )

    client = Mailtrap::Client.new(api_key: ENV["MAILTRAP_TOKEN"], api_host: "send.api.mailtrap.io")

    response = client.send(mail)

    render json: response, status: :created
  end

  private

  def email_params
    params.require(:email).permit(:name, :address, :message)
  end
end

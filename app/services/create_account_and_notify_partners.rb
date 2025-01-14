class CreateAccountAndNotifyPartners < ApplicationService
  def initialize(data)
    @params = data
  end

  def call
    CreateAccount.call(@params, from_fintera?)
    NotifyPartner.new.perform
    NotifyPartner.new("another").perform
  end

  private

  def from_fintera?
    return false unless @params[:name].include? "Fintera"

    @params[:users].each do |user|
      return true if user[:email].include? "fintera.com.br"
    end

    false
  end
end

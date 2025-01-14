class CreateRegistration < ApplicationService
  def initialize(payload)
    @payload = payload
  end

  def call
    @result = if @payload[:from_partner] == true
                if @payload[:many_partners] == true
                  create_account_and_notify_partners
                else
                  create_account_and_notify_partner
                end
              else
                create_account
              end

    return Result.new(true, @result.data) if @result.success?
  end

  private

  def create_account_and_notify_partner
    CreateAccountAndNotifyPartner.call(@payload)
  end

  def create_account_and_notify_partners
    CreateAccountAndNotifyPartners.call(@payload)
  end

  def create_account
    if @payload[:name].include?("Fintera") && fintera_users(@payload) == true
      CreateAccount.call(@payload, true)
    else
      CreateAccount.call(@payload, false)
    end
  end

  def fintera_users(payload)
    with_fintera_user = false

    payload[:users].each do |user|
      with_fintera_user = true if user[:email].include? "fintera.com.br"
    end

    with_fintera_user
  end
end

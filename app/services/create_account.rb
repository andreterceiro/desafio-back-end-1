# rubocop: disable Rails/SkipsModelValidations
class CreateAccount < ApplicationService
  # rubocop: disable Style/OptionalBooleanParameter
  def initialize(payload, from_fintera = false)
    # rubocop: enable Style/OptionalBooleanParameter
    @payload = payload
    @from_fintera = from_fintera
    @errors = []
  end

  # rubocop: disable Metrics/MethodLength
  def call
    if Account.valid? @payload
      account = Account.new(account_params)
      if account.save && User.insert_all(users_params(account))
        Result.new(true, account)
      else
        @errors << account.errors.full_messages
        Result.new(false, nil, @errors.join(","))
      end
    else
      @errors << "Account is not valid"
      Result.new(false, nil, @errors.join(","))
    end
  end
  # rubocop: enable Metrics/MethodLength

  # rubocop: disable Metrics/MethodLength
  def account_params
    if @from_fintera
      {
        name: @payload[:name],
        active: true,
      }
    else
      {
        name: @payload[:name],
        active: false,
      }
    end
  end

  def users_params(account)
    @payload[:users].map do |user|
      {
        first_name: user[:first_name],
        last_name: user[:last_name],
        email: user[:email],
        phone: user[:phone].to_s.gsub(/\D/, ""),
        account_id: account.id,
        created_at: Time.zone.now,
        updated_at: Time.zone.now,
      }
    end
  end
  # rubocop: enable Metrics/MethodLength
end
# rubocop: enable Rails/SkipsModelValidations

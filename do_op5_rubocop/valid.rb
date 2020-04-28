# frozen_string_literal: true

# check validation
module Valid
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end

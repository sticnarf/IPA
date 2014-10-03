class UploadController < ApplicationController
  def token
    name = generate_random_name
    put_policy = Qiniu::Auth::PutPolicy.new(
        "ipa-private",
        name,
        10000
    )
    render json: { token: Qiniu::Auth.generate_uptoken(put_policy), key: name }
  end

  private

  def generate_random_name
    name = ""
    8.times { name += SecureRandom.random_number(36**8).to_s(36).rjust(8, '0') }
    name
  end
end

class UploadController < ApplicationController
  def token
    name = generate_random_name
    put_policy = Qiniu::Auth::PutPolicy.new(
        "ipa-private",
        name,
        10000
    )
    put_policy.callback_url = "http://121.235.158.122:3000/upload/callback"
    put_policy.callback_body = 'name=$(fname)&hash=$(etag)'
    render json: { token: Qiniu::Auth.generate_uptoken(put_policy), key: name }
  end

  def callback

  end

  private

  def generate_random_name
    name = ""
    8.times { name += SecureRandom.random_number(36**8).to_s(36).rjust(8, '0') }
    name
  end
end

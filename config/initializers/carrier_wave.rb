if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id: Rails.application.credentials.aws[:access_key_id],                       # required unless using use_iam_profile
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
      region: 'ap-northeast-1'                        # required 
    }
    config.fog_directory = Rails.application.credentials.aws[:s3_bucket]
    config.fog_public = false
  end
end
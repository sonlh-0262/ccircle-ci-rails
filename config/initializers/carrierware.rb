CarrierWave.configure do |config|
  config.storage = :aws

  config.aws_credentials = {
    region: 'ap-southeast-1',
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end

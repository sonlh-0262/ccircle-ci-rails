require 'aws-sdk-s3'

S3_CLIENT = Aws::S3::Client.new(
  region: ENV['AWS_REGION'],
  access_key_id: ENV['ACCESS_KEY_ID'],
  secret_access_key: ENV['SECRET_ACCESS_KEY']
)

S3_RESOURCE = Aws::S3::Resource.new client: S3_CLIENT
S3_BUCKET = S3_RESOURCE.bucket ENV['BUCKET_NAME']

Paperclip::Attachment.default_options.update({
#  :storage => :fog,
#  :fog_credentials => {
#    :aws_access_key_id => "AKIAJSWT7MY44B6EV2TQ",
#    :aws_secret_access_key => "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",
#    :provider => 'AWS',
#    :region => 'us-east-1',
#  },
#  :fog_public    => true,
#  :fog_directory => "chicagoideas_development",
#  :fog_host      => "http://s3.amazonaws.com",
#  :path          => ":class/:attachment/:id/:style/:filename"
  :storage        => :s3,
  :s3_credentials => {
    :access_key_id     => "AKIAJSWT7MY44B6EV2TQ",
    :secret_access_key => "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",
    :bucket            => "chicagoideas_development"
  },
  :path           => ":class/:attachment/:id/:style/:filename"
})

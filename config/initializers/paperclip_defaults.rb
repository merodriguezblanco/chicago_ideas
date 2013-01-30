if Rails.env == 'test'
 Paperclip::Attachment.default_options.update({
    :storage        => :filesystem,
    :path           => ":class/:attachment/:id/:style/:filename"
  })
else
  Paperclip::Attachment.default_options.update({
    :storage        => :s3,
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
    :path           => ":class/:attachment/:id/:style/:filename"
  })
end
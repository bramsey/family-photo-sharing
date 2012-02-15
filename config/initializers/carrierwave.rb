CarrierWave.configure do |config|
    
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'aws_access_key',       # required
    :aws_secret_access_key  => 'aws_secret_access_key'       # required
  }
  config.fog_directory  = 's3_directory'                     # required
  #config.fog_host       = 'https://assets.example.com'            # optional, defaults to nil
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end

module CarrierWave
  module MiniMagick
    def quality(percentage)
      manipulate! do |img|
        img.quality(percentage)
        img = yield(img) if block_given?
        img
      end
    end
  end
end
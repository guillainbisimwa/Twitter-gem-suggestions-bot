class TwitterKey
  attr_accessor :consumer_key, :consumer_secret, :access_token, :access_token_secret

  def initialize
    @consumer_key = ''
    @consumer_secret = ''
    @access_token = ''
    @access_token_secret = ''
  end
end

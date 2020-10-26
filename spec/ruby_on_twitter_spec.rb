require './lib/ruby_on_twitter'

describe 'Fetch 100 tweets' do
  let(:ruby_twitter) { RubyOnTwitter.new }

  it 'Should not return nil' do
    expect(ruby_twitter.fetch_100_tweet).not_to be_nil
  end
end

describe 'Fetch 100 tweets' do
  let(:ruby_twitter) { RubyOnTwitter.new }

  it 'Should return 100' do
    expect(ruby_twitter.fetch_100_tweet).to eql(100)
  end
end

describe 'Format a tweet method' do
  let(:ruby_twitter) { RubyOnTwitter.new }

  it 'Should not return nil' do
    expect(ruby_twitter.format_text('')).not_to be_nil
  end
end

describe 'Format a tweet method' do
  let(:ruby_twitter) { RubyOnTwitter.new }

  it 'Should return an array' do
    expect(ruby_twitter.format_text('gem (0.3.1): details. https://link')).to eql(['gem', 'details.', 'https://link'])
  end
end

describe 'Format a tweet method' do
  let(:ruby_twitter) { RubyOnTwitter.new }
  let(:t) { ruby_twitter.format_text('gem (0.3.1): details. https://link') }
  it 'Should return an array of length 3' do
    expect(t.length).to eql(3)
  end
end

describe 'Post a random tweet' do
  let(:ruby_twitter) { RubyOnTwitter.new }
  it 'Should not return nil' do
    ruby_twitter.fetch_100_tweet
    expect(ruby_twitter.post_random_tweet).not_to be_nil
  end
end

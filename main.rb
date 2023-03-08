require 'dotenv'
require 'json'
require 'mastodon'
require 'clockwork'
require 'logger'

include Clockwork

# load .env
Dotenv.load

# generate logger
logger = Logger.new(STDERR)

# handler for job
handler do |job|
  puts "Running #{job}"
end

# Running job with every 30 minitues
every(30.minutes, 'boost.job') do 
  client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])

  client.hashtag_timeline("顔面工事").each do |toot|
    if !toot.reblogged? then
      response = client.reblog(toot.id)
      response = client.favourite(toot.id)
    end
  end
end

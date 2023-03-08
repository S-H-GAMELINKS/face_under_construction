require 'dotenv'
require 'json'
require 'mastodon'

Dotenv.load

client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])

client.hashtag_timeline("顔面工事").each do |toot|
    if !toot.reblogged? then
      response = client.reblog(toot.id)
      response = client.favourite(toot.id)
    end
end

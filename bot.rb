load_paths = Dir["/vendor/bundle/ruby/2.5.0/gems/2.5.0/**/lib"]
$LOAD_PATH.unshift(*load_paths)

require "dotenv"
require "json"
require 'mastodon'

Dotenv.env

def lambda_handler(event:, context:)

  client = Mastodon::REST::Client.new(base_url: ENV["MASTODON_URL"], bearer_token: ENV["MASTODON_ACCESS_TOKEN"])

    client.hashtag_timeline("顔面工事", :limit => 5000).each do |toot|
        if !toot.reblogged? then
          response = client.reblog(toot.id)
          response = client.favourite(toot.id)
        end
    end
end

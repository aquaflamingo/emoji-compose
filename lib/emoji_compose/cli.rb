require "thor"
require 'slack-ruby-client'
require 'yaml'

module EmojiCompose
  #
  # The CLI devlogs CLI
  #
  class CLI < Thor
    package_name "emoji_compose"

    # Returns exit with non zero status when an exception occurs
    def self.exit_on_failure?
      true
    end

    desc "pull", "Liberates emojis from the tyranny of single workspaces"
    method_options slack_token: :string, required: :true
    method_options name: :string, required: :true
    def pull 
      client = Slack::Web::Client.new(token: options.slack_token)

      response = client.emoji_list

      emojis = response['emoji']

      # Store the emojis in a YAML file
      emoji_data = {"name" => options.name, "emojis" => [], "version" => '0.0.1'}

      emojis.each do |emoji_name, emoji_url|
        emoji_data["emojis"] << {emoji_name => {"image" => emoji_url}}
        emoji_data["emojis"][-1][emoji_name]["slackcode"] = ":#{emoji_name}:"
      end

      File.write("emoji-compose.yml", YAML.dump(emoji_data))

      puts "Created emoji-compose.yml"
    end

    desc "transfer", "Transfers emojis from the bonds of captivity to freedom!"
    method_options old_slack_token: :string, required: :true
    method_options new_slack_token: :string, required: :true
    def transfer
      old_client = Slack::Web::Client.new(token: options.captivity_slack_token)
      new_client = Slack::Web::Client.new(token: options.freedom_slack_token)

      # Retrieve a list of all the custom emojis in your old Slack workspace
      response = old_client.emoji_list

      emojis = response['emoji']

      # Upload each custom emoji to your new Slack workspace
      emojis.each do |emoji_name, emoji_url|
        new_client.emoji_add(
          name: emoji_name,
          url: emoji_url
        )

        puts "Uploaded #{emoji_name} to new Slack workspace"
      end
    end

    #
    # Returns version of the cli
    #
    desc "version", "Prints the current version"
    def version
      puts EmojiCompose::VERSION
    end
  end
end

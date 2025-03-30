require "openai"
require "dotenv/load"

client = OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

puts "Hello! How can I help you today?"
puts "-"*50

user_message = gets.chomp


# Prepare an Array of previous messages
message_list = [
  {
    :role => "system",
    :content => "You are a helpful assistant."
  },
  {
    :role => "user",
    :content => user_message
  }
]

# Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

nice_response = api_response.fetch("choices").at(0).fetch("message").fetch("content")

puts nice_response
puts "-" * 50

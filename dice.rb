require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get "/" do
  erb(:elephant)
end

get "/zebra" do
  "We must add a route for each path we want to support."
end

get "/giraffe" do
  "Hopefully this shows up without having to restart our server."
end

get "/dice/2/6" do
  @head = "2d6"
  @rolls = []
  2.times do
    die = rand(1..6)
    @rolls.push(die)
  end
  erb(:dice_roll)
end

get "/dice/2/10" do
  @head = "2d10"
  @rolls = []
  2.times do
    die = rand(1..10)
    @rolls.push(die)
  end
  erb(:dice_roll)
end

get "/dice/1/20" do
  @head = "1d20"
  @rolls = []
  1.times do
    die = rand(1..20)
    @rolls.push(die)
  end
  erb(:dice_roll)
end

get "/dice/5/4" do
  @head = "5d4"
  @rolls = []
  5.times do
    die = rand(1..6)
    @rolls.push(die)
  end
  erb(:dice_roll)
end

get "/dice/100/6" do
  @head = "100d6"
  @rolls = []
  100.times do
    die = rand(1..6)
    @rolls.push(die)
  end
  erb(:dice_roll)
end

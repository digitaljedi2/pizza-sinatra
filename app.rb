require 'sinatra'
require 'sinatra/base'
require 'mongoid'

# DB Setup
Mongoid.load! "mongoid.config"

# Models
class Order
    field :size, type: String
    field :toppings, type: String
    field :order_id, type: String
    field :name, type: String

    validates :size, presence: true
    validates :toppings, presence: true
    validates :order_id, presence: true

    index({ name: 'text'})
    index({ order_id:1}, {unique: true, name: 'order_id_index'})

end

class App < Sinatra::Base
  get '/' do
    'Welcome to Pizza'
  end
end



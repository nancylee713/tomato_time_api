require 'faraday'
require 'pry'
require 'json'
require 'pp'

class TomatoApi < Sinatra::Base
  def index
    @presenter = SearchPresenter.new(params)
  end
end

module CKAN
  class API
    @api_url = "http://ckan.net/api/3"
    def self.api_url=(api_url)
      @api_url = api_url.chomp("/")
    end
    def self.api_url
      @api_url
    end
  end
end

require 'open-uri'
require "net/http"
require 'rest_client'
require "uri"
require 'json'
require_relative 'ckan/model'
require_relative 'ckan/group'
require_relative 'ckan/package'
require_relative 'ckan/resource'
require_relative 'ckan/version'
require_relative 'ckan/datastore'
require_relative 'ckan/action'

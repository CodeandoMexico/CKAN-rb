module CKAN
  class Action

    #all get actions
    ## ckan.logic.action.get.organization_list
    def self.action_get(action, options_hash={}, api_key="")
      uri = URI("#{CKAN::API.api_url}/action/#{action}")
      uri.query = URI.encode_www_form(options_hash)

      req = Net::HTTP::Get.new(uri)
      req["Authorization"] = api_key
      req["X-CKAN-API-Key"] = api_key

      res = Net::HTTP.start(uri.hostname, uri.port) {|http|
        http.request(req)
      }

      JSON.parse(res.body)
    end

    #all create actions
    #ckan.logic.action.create.package_create
    def self.action_create(action, api_key, options_hash={} )
      unless options_hash.has_key?(:upload)
        options_hash = options_hash.to_json
      end
      response = RestClient.post(
        "#{CKAN::API.api_url}/action/#{action}",
        options_hash,
        "Authorization" => api_key,
        "X-CKAN-API-Key" => api_key
      )
      JSON.parse(response)
    end

  end
end

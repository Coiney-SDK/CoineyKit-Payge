require 'uri'
require 'net/http'
require 'json'

class Payge
  attr_reader :secret_key, :major_version, :minor_version

  def initialize(secret_key, major_version, minor_version)
    @secret_key = secret_key
    @major_version = major_version
    @minor_version = minor_version
  end

  def list
    uri = URI.parse("#{base_url}/api/#{@major_version}/payments")
    request(uri) do |http|
      http.get(uri.path, header)
    end
  end

  def get(id)
    uri = URI.parse("#{base_url}/api/#{@major_version}/payments/#{id}")
    request(uri) do |http|
      http.get(uri.path, header)
    end
  end

  def create(params = {})
    uri = URI.parse("#{base_url}/api/#{@major_version}/payments")
    request(uri) do |http|
      http.post(uri.path, params.to_json, header)
    end
  end

  def update(id, params = {})
    uri = URI.parse("#{base_url}/api/#{@major_version}/payments/#{id}")
    request(uri) do |http|
      http.patch(uri.path, params.to_json, header)
    end
  end

  private
  def request(uri, &block)
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
      block.call(http)
    end

    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      response.value
    end
  end

  def base_url
    'https://api.coiney.io'
  end

  def header
    {
      'Authorization' => "Bearer #{@secret_key}",
      'X-CoineyPayge-Version' => @minor_version,
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end
end

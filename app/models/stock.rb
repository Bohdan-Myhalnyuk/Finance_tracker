class Stock < ApplicationRecord
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
                                  endpoint: 'https://cloud.iexapis.com/v1')
    begin
      new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name,
          last_price: client.price(ticker_symbol))
    rescue StandardError
      nil
    end
  end
  # Class method that gonna retriev the price of the stock via our method parametr "ticker_symbol"
end
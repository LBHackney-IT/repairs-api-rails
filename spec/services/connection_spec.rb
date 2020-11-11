# frozen_string_literal: true

require "rails_helper"

RSpec.describe Connection do
  describe ".api" do
    let(:faraday_connection) { spy }
    let(:headers)            { spy }

    let(:url) { "https://www.example.com" }
    let(:key) { "1234567890" }

    it "makes a Faraday connection with the supplied URL and key in headers" do
      expect(Faraday).to receive(:new).with(url: url).and_yield(faraday_connection)

      expect(faraday_connection).to receive(:headers).at_least(:once).and_return headers
      expect(headers).to receive(:[]=).with("x-api-key", key)

      described_class.api(url: url, key: key)
    end
  end
end

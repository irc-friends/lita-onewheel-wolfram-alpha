require_relative '../../spec_helper'

describe Lita::Handlers::OnewheelWolframAlpha, :lita_handler => true do

  before(:each) do
    # mock_geocoder = ::Geocoder::Result::Google.new({'formatted_address' => 'Portland, OR', 'geometry' => { 'location' => { 'lat' => 45.523452, 'lng' => -122.676207 }}})
    # allow(::Geocoder).to receive(:search) { [mock_geocoder] }  # It expects an array of geocoder objects.

    # Mock up the Wolfram Alpha call.
    # mock_weather_json = File.open("spec/mock_weather.json").read
    # allow(RestClient).to receive(:get) { mock_weather_json }

    registry.configure do |config|
      config.handlers.onewheel_wolfram_alpha.api_uri = 'http://api.wolframalpha.com/v2/query?input=[query]&appid=[appid]'
      config.handlers.onewheel_wolfram_alpha.app_id = 'app-id-here'
    end
  end

  it { is_expected.to route_command('alpha') }

  it 'will work' do
    send_message '!alpha pi'
    expect(replies.last).to eq('3.1415926535897932384626433832795028841971693993751058...')
  end
end

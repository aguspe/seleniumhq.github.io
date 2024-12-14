require 'spec_helper'

RSpec.describe 'Network' do
  let(:driver) { start_bidi_session }
  let(:wait) { Selenium::WebDriver::Wait.new(timeout: 2) }

  it 'adds an auth handler', skip: 'until Selenium release 4.28.0' do
    network = driver.network
    network.add_authentication_handler('username', 'password')
    expect(network.callbacks.count).to be 1
  end

  it 'adds a request handler', skip: 'until Selenium release 4.28.0' do
    network = driver.network
    network.add_request_handler
    expect(network.callbacks.count).to be 1
  end

  it 'adds a response handler', skip: 'until Selenium release 4.28.0' do
    network = driver.network
    network.add_response_handler
    expect(network.callbacks.count).to be 1
  end

  it 'removes a handler', skip: 'until Selenium release 4.28.0' do
    network = driver.network
    id = network.add_request_handler
    network.remove_handler(id)
    expect(network.callbacks.count).to be 0
  end

  it 'clears all handlers', skip: 'until Selenium release 4.28.0' do
    network = driver.network
    network.add_request_handler
    network.add_request_handler
    network.clear_handlers
    expect(network.callbacks.count).to be 0
  end
end

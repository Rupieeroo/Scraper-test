require 'scraper'

describe 'Scraper' do
  it 'prints hello world' do
    a = Scraper.new
    expect(a.hello).to eq('Hello World')
  end
end

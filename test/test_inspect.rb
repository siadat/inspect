require 'minitest/autorun'
require 'inspect'

class InspectTest < Minitest::Test
  def test_json
    x = parse_data(nil, File.read('./test/example.json'))
    assert_equal  3.14, x['pi']
  end

  def test_csv
    x = parse_data(nil, File.read('./test/example.csv'))
    assert_equal x.count, 2
    assert_equal ['name', 'value'], x.first
    assert_equal ['pi', '3.14'], x.last
  end

  def test_html
    x = parse_data(nil, File.read('./test/example.html'))
    assert_equal  'Pi is 3.14', x.children.last.text.strip
  end
end

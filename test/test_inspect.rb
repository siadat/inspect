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

  def test_xml
    x = parse_data(nil, File.read('./test/example.xml'))
    assert_equal 'Al Bundy', x.xpath("//character")[0].text
    assert_equal 'The A-Team', x.css("dramas name").text
    assert_equal 'Larry Appleton', x.search("character")[3].text
  end

  def test_yml
    x = parse_data(nil, File.read('./test/example.yml'))
    assert_equal 'Dorothy', x['customer']['first_name']
    assert_equal 'High Heeled "Ruby" Slippers', x['items'][1]['descrip']
  end
  
end

# inspect

Inspect a JSON, CSV, HTML, YML or XML file in a Ruby REPL.

Try:

	echo '{"hello": "world"}' | inspect

And you will get:

    [1] pry(main)>

Data is parsed and stored as `x`:

    [1] pry(main)> x['hello']
    => "world"
    [2] pry(main)>

### Install

    gem install inspect

### Usage

    cat FILE | inspect

### Examples

    cat file.csv | inspect
    cat file.json | inspect
    cat file.html | inspect
    cat file.xml | inspect
    cat file.yml | inspect

    curl https://api.github.com/users/siadat/repos | inspect
	curl https://api.github.com/repos/siadat/inspect/commits | inspect
    
    inspect file.html
    inspect file.xml
    inspect file.json
    inspect file.csv
    inspect file.yml

### Contribute

Create an issue or send a pull request. Use rake to run all tests:

    rake test

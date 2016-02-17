# inspect

Inspect a JSON, CSV or HTML file in a Ruby REPL. Try:

	curl https://api.github.com/repos/siadat/inspect/commits | inspect

And you will get:

    [1] pry(main)> x.first['commit']['author']['name']
    => "Sina Siadat"
    [2] pry(main)>

## Install

    gem install inspect

## Usage

    cat FILE | inspect [FORMAT]

`FORMAT` is optional and could be one of the following: `json`, `html`, `csv`

## Examples

    cat file.json | inspect
    cat file.csv  | inspect
    cat file.html | inspect
    cat file.html | inspect html
    curl https://api.github.com/users/siadat/repos | inspect
    curl https://github.com/siadat                 | inspect

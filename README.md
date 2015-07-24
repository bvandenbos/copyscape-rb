copyscape
=========

Ruby wrapper for the Copyscape API.


Usage
-----

First, you'll need to setup your [Copyscape](http://www.copyscape.com/) account and whatnot.  You can do
that [here](http://www.copyscape.com/signup.php?pro=1&o=f).

Next, install the gem.

    $ gem install copyscape

And then you can do things like this...

```ruby
  Copyscape.username = 'yourname'
  Copyscape.api_key = 'abc123'

  # URL search
  search = Copyscape.url_search("http://www.copyscape.com/example.html")
  search.duplicate? # => true
  search.count # => 81
  search.duplicates.each do |duplicate|
    puts duplciate['title']
    puts duplicate['url']
    puts duplicate['textsnippet']
    puts duplicate['htmlsnippet']
    puts duplicate['minwordsmatched']
  end

  # Text search
  search = Copyscape.text_search('This is some text I want to check for plagurism')
  search.duplicate? # => false
```

Currently, there is no support in the gem for "private index" searching, though
it would be pretty easy to add.


More...
-------

I'm in no way associated with Copyscape.


License
-------

See [LICENSE](LICENSE)

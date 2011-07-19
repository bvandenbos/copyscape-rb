copyscape
---------

Ruby wrapper for the Copyscape API.

Usage
=====

First, you'll need to setup your Copyscape account and enable API access.

    $ gem install copyscape-rb

And then...

    Copyscape.username = 'yourname'
    Copyscape.api_key = 'abc123'
    
    search = Copyscape.search("http://www.copyscape.com/example.html")
    search.duplicate? # => true
    search.count # => 81
    search.duplicates.each do |duplicate|
      puts duplciate['title']
      puts duplicate['url']
      puts duplicate['textsnippet']
      puts duplicate['htmlsnippet']
      puts duplicate['minwordsmatched']
    end
    


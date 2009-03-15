Terror
===

A micro feed aggregator based on [Sinatra](http://www.sinatrarb.com/)

Installation
---

	sudo gem install sinatra feed-normalizer	
	git clone git://github.com/pilu/terror.git
	
Configuration
---

	cd path/to/terror
	cp config/terror.yml.default config/terror.yml
	
Edit the terror.yml file adding your feeds and database preferences.

Fetching feeds
---

	rake feeds:fetch

Enjoy

	ruby terror_aggregator.rb
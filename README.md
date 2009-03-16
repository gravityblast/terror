Terror
===

A micro feed aggregator based on [Sinatra](http://www.sinatrarb.com/)

Installation
---

	gem sources -a http://gems.github.com
	sudo gem install pilu-terror
	
Creating a new aggrgator
---

	terror new_aggregator_name
	cd new_aggregator_name
	thin start -C config/thin.yml
	
Edit the config/terror.yml file adding your feeds and database preferences.

Fetching feeds
---
		
	rake feeds:fetch

Enjoy	
	
Copyright
---

Copyright (c) 2009 [Andrea Franz](http://gravityblast.com). See LICENSE for details.

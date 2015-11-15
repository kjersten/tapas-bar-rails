# Tapas Bar (Rails)

An app to watch RubyTapas episodes and keep track of the ones I've seen.

This is based on [Mislav's Tapas Bar](https://github.com/mislav/tapas-bar).

I changed a few things:
* episodes are displayed in a table (courtesy of [datatables](https://www.datatables.net/))
* I added a simple authentication layer so I can host the app on a remote server
* I'm using Rails instead of Sinatra to make testing easier

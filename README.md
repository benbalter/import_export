# ImportExport

[![Gem Version](https://badge.fury.io/rb/import_export.svg)](http://badge.fury.io/rb/import_export) [![Build Status](https://travis-ci.org/benbalter/import_export.svg)](https://travis-ci.org/benbalter/import_export)

A Ruby client for [Trade.gov's Consolidated Screening List](http://developer.trade.gov/consolidated-screening-list.html)

## Usage

```irb
client = ImportExport::Client.new :api_key => "12345"
client.search :q => "smith"
=> [
  #<ImportExport::Result name="PRIDMORE-SMITH, BRAMWELL J.">,
  #<ImportExport::Result name="PRIDMORE-SMITH, JOHN B.">
]

client.search :name => "smith", :fuzzy_name => true
=> [
  #<ImportExport::Result name="PRIDMORE-SMITH, JOHN B.">,
  #<ImportExport::Result name="PRIDMORE-SMITH, BRAMWELL J.">,
  #<ImportExport::Result name="MID-SOUTH INVESTMENTS LIMITED">,
  #<ImportExport::Result name="SOUTH-EAST MOVEMENT">,
  ...
]
```

### Available parameters

* `q`
* `sources`
* `countries` (defaults to all countries)
* `address`
* `name`
* `fuzzy_name` (true or false)
* `type`
* `size` (number of results per page, defaults to 100)
* `offset` (defaults to 0)
* `api_key` (defaults to ENV["TRADE_API_KEY"])

For more information, see [the Consolidated Screening List API docs](http://developer.trade.gov/consolidated-screening-list.html).

### Command line usage

```
import_export [NAME]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/consolidated_screening_list/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

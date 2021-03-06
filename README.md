Overview [![Gem Version](https://badge.fury.io/rb/doc2json.svg)](http://badge.fury.io/rb/doc2json)
========
[![Build Status](https://travis-ci.org/jens-na/doc2json.svg?branch=master)](https://travis-ci.org/jens-na/doc2json) 
[![Code Climate](https://codeclimate.com/github/jens-na/doc2json.png)](https://codeclimate.com/github/jens-na/doc2json) [![Dependency Status](https://gemnasium.com/jens-na/doc2json.svg)](https://gemnasium.com/jens-na/doc2json)

**doc2json** generates a JSON based ruby documentation with YARD. 

Installation
============

```bash
gem install doc2json
```

Afterwards you can generate a machine friendly documentation for
your project.

Usage
=====

```bash
doc2json "lib/**/.rb" "doc/json"
```
This will generate a json based documentation for all `*.rb` files inside
your `lib` directory and outputs the files in `./doc/json`

License
=======
Licensed under the MIT License
(c) Jens Nazarenus, 2014

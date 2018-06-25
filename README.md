# fish_print_file_usage

[![Build Status](https://travis-ci.com/evanlucas/fish_print_file_usage.svg?branch=master)](https://travis-ci.com/evanlucas/fish_print_file_usage)

> A hacky way to add usage to a fish function

## Install

```bash
$ fisher i evanlucas/fish_print_file_usage
```

## Test

```bash
$ fisher i fishtape .
$ fishtape test/*.fish
```

## Usage

Say you have a function called wait-for-url

```fish
### usage
# wait-for-url: Wait for a url to return a 200 status code
#
#  usage: wait-for-url [options] <url>
#
#  options:
#    -h, --help            show help and usage
#
#  arguments:
#    url                   the url to check
###

function wait-for-url
  set -l options 'h/help'
  argparse -n wait-for-url $options -- $argv
  or return

  if set -q _flag_help
    fish_print_file_usage (status -f)
    return 0
  end

  if not set -q argv[1]
    fish_print_file_usage (status -f)
    return 1
  end

  # rest of function
end
```

Then, when you run `wait-for-url -h`, the following will be output:

```
wait-for-url: Wait for a url to return a 200 status code

  usage: wait-for-url [options] <url>

  options:
    -h, --help            show help and usage

  arguments:
    url                   the url to check
```

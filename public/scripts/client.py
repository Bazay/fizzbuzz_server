#!/usr/bin/env python
import sys
import json
import argparse
# install 'requests' using command `pip install requests`
import requests

### FizzBuzz Python Client
# Created by Baron Bloomer
#
# Instructions:
#
# Run `json_client.py -h` for usage details
#

class ArgumentParser:
  def __init__(self):
    self.parser = self.__setup_parser()
    self.args = self.parser.parse_args()
    if self.__number_option_required() and not self.args.number:
      self.__raise_number_error()

  def action(self):
    return self.args.action

  def options(self):
    if self.action() == 'view':
      return { 'page': self.args.page, 'per_page': self.args.count }
    else:
      return { 'number': self.args.number }

  def __setup_parser(self):
    parser = argparse.ArgumentParser(prog='FizzBuzz Python Client', description = 'Client for the Fizz Buzz API.')
    parser.add_argument('action', metavar = 'ACTION', type = str, action = 'store', help = 'specify operation to perform (view|favourite|unfavourite)', choices = ['view', 'favourite', 'unfavourite'])
    parser.add_argument('-p', '--page', dest = 'page', type = int, default = 1, help = 'an integer to specify page of results')
    parser.add_argument('-c', '--count', dest = 'count', type = int, default = 100, help = 'an integer count to specify how many per page of results')
    parser.add_argument('-n', '--number', dest = 'number', type = int, help = 'the number fizz buzz you want to favourite')
    return parser

  def __raise_number_error(self):
    print 'ERROR! The -n NUMBER flag required for action: %s' % self.action()
    self.parser.print_help()
    sys.exit()

  def __number_option_required(self):
    return self.action() == 'favourite' or self.action() == 'unfavourite'


class UrlBuilder():
  host = 'https://fizzbuzzbaron.herokuapp.com'
  api_path = '/api/v1.0'

  def __init__(self, action, options):
    self.action = action
    self.options = options

  def url(self):
    return '{0}{1}/fizz_buzz'.format(self.host, self.api_path)

  def params(self):
    if self.action == 'view':
      return self.options
    elif self.action == 'favourite':
      self.options['favourite'] = True
      return self.__format_fizz_buzz_params(self.options)
    elif self.action == 'unfavourite':
      self.options['favourite'] = False
      return self.__format_fizz_buzz_params(self.options)

  def __format_fizz_buzz_params(self, params):
    return { 'fizz_buzz': params }


class ApiRequestHandler:
  def __init__(self, url, action, params):
    self.url = url
    self.action = action
    self.params = params

  def method(self):
    if self.action == 'view':
      return 'get'
    else:
      return 'post'

  def request(self):
    print '...Sending request...'
    if self.method() == 'get':
      request_kwargs = { 'params': self.params }
    else:
      request_kwargs = { 'json': self.params }
    return getattr(requests, self.method())(self.url, **request_kwargs)


class Formatter():
  def print_performing_action(self, action):
    print 'Performing action: %s' % action

  def print_horizontal_rule(self):
    print '========================================'


class ResponseFormatter(Formatter):
  def __init__(self, response):
    self.status_code = response.status_code
    self.content = response.content

  def format(self):
    if self.status_code == 200 or self.status_code == 201:
      self.print_response_success()
    else:
      print 'The server responded with error status: %d' % self.status_code

  def parsed_json_response(self):
    return json.loads(self.content)

  def print_response_success(self):
    self.print_horizontal_rule()
    print 'Response: (status %d)' % self.status_code
    if self.status_code == 200:
      self.print_pagination()
      for fizz_buzz in self.parsed_json_response().get('fizz_buzzes'):
        self.print_fizz_buzz(fizz_buzz)
    elif self.status_code == 201:
      self.print_favourite_success_message()

  def print_favourite_success_message(self):
    print 'Successfully updated fizz buzz %d' % self.parsed_json_response().get('fizz_buzz').get('number')

  def print_fizz_buzz(self, fizz_buzz):
    print '{0} {1} {2}'.format(fizz_buzz.get('number'), fizz_buzz.get('classification'), self.icon_for_favourite(fizz_buzz.get('favourite')))

  def print_pagination(self):
    placeholders = { 'previous': '  | ', 'page': self.parsed_json_response().get('page'), 'next': ' |  ' }
    if self.parsed_json_response().get('page') > 1:
      placeholders['previous'] = '< | '
    if self.parsed_json_response().get('last_page') == False:
      placeholders['next'] = ' | >'
    print '{0}{1}{2}'.format(placeholders.get('previous'), placeholders.get('page'), placeholders.get('next'))

  def icon_for_favourite(self, favourite):
    if favourite:
      return '*'
    else:
      return ''


class Client:
  def __init__(self, action, options):
    self.action = action
    self.url_builder = UrlBuilder(action, options)
    self.handler = ApiRequestHandler(self.url_builder.url(), action, self.url_builder.params())

  def perform(self):
    Formatter().print_performing_action(self.action)
    Formatter().print_horizontal_rule()
    ResponseFormatter(self.handler.request()).format()


# Execute program
parser = ArgumentParser()
client = Client(parser.action(), parser.options())
client.perform()


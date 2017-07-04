# README

Created by Baron Bloomer

**Live Demo**  
[Click here](https://fizzbuzzbaron.herokuapp.com)

**JSON API Client (Instructions)**  
The client is written in Python and is located under:

```
/public/scripts/client.py
```

or alternatively you can execute the following command in the terminal to download the script to your working directory.

```
curl -O https://fizzbuzzbaron.herokuapp.com/scripts/client.py
```

Instructions on how to use the client can be found by executing the downloaded file with python using the `-h` option:

```
python client.py -h
```

## Task A

### Ruby On Rails FizzBuzz application

Standard FizzBuzz rules, divisible by 3 is Fizz, divisible by 5 is Buzz
* Should display values from 1 to 100 on the homepage
* Should allow viewing values up to 100,000,000,000
* Should have pagination (not from libraries)
* Should allow changing of the page size
* User should be able to mark certain numbers as their favourites, these should indicate that they are favourites on the UI and be persisted
* Should provide a JSON API with all the above-mentioned functionality

## Task B

### JSON API Client

Create a fully featured client for the FizzBuzz application API
* Should be available from the command line (CLI)
* Should be written in a language other than Ruby/Elixir (no shell scripts)

## Notes

* We value best practice and clean code.
* Please provide a full tests coverage.
* Use a public repository account (i.e. Bitbucket/Github) to publish your result.
* Commit early and often with clear messages.
* If you need further info, please contact us.

# Moby Dick Text Sorting Application

The Moby Dick App is a Ruby on Rails web-application. The goal of the project is to sort the text of Moby Dick by the top 100 most frequently occurring words while excluding certain stop words, paired with the count occurence of the words.

* Ruby version: 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin16]

* Configuration: --skip coffee

* Database creation: postgresql

## Getting Started

Follow the instructions below to get started on using the application.

### Prerequisites

What things you need to install the software and how to install them

1. Install Ruby at the command prompt if you haven't yet:
```
$  sudo apt-get install ruby-dev
```
Make sure Ruby is installed on your system:
```
$  ruby -v
```
2. Install Rails at the command prompt if you haven't yet:
```
$ gem install rails
```
Make sure Rails is installed on your system:
```
$  rails -v
```
If you see the Ruby and Rails versions, then you're good to start!

### Installation

1. Clone the application by running command:
```
$ https://github.com/jasmineimliu/moby-dick-app.git
```
2. Install all dependencies
```
$ bundle install
```
3. Create db and migrate schema
```
$ rails db:create
$ rails db:migrate
```
4. Now run your application on localhost:3000
```
$ rails s
```

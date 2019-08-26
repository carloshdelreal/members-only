# Members - Only

This is the [Members-Only project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/authentication) a tutorial and excercices to master the skilss using the Ruby on Rails authentication System. This repository follows the instructions and pair programming methodology of [The Oding Project](https://www.theodinproject.com). The final code is reviewed for a [Microverse](https://www.microverse.org/) Technical Support Engineer TSE that supervises, makes suggestions and approves the completeness of the final product.

In this project it was used:

* Ruby
* Ruby on Rails Framework
* HTML
* CSS


# Author

This project was created by:

* Carlos Del Real [Github Account https://github.com/carloshdelreal](https://github.com/carloshdelreal)
* António Fernandes [Github account](https://github.com/trox115) [https://github.com/trox115][https://github.com/trox115] 


# The Web App

The live version of this project is on [Members-Only by Carlos and António]()

# Required Installations

If you want a copy of this project running on your machine you have to install:

* Ruby 2.6
* gem 3.0
* Bundler 1.17
* Rails 5.2

For installation instructions follow [The Instalation Guide](https://www.tutorialspoint.com/ruby-on-rails/rails-installation)


# Instalation of This App

Once you have installed the requiered packages shown on the [Required Installations](), proceed with the following steps

Clone the Repository, the folder toy_app will be downloaded

```Shell
your@pc:~$ git clone https://github.com/carloshdelreal/members-only.git
```

Move to the downloaded folder

```Shell
your@pc:~$ cd members-only
```

install gems

```Shell
your@pc:~$ bundle install --without production
```

migrate the database

```Shell
your@pc:~$ rails db:migrate
```
Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```
If the test suite passes, you'll be ready to run the app in a local server:

```Shell
your@pc:~$ rails server

```

Then, go to [http://localhost:3000/](http://localhost:3000/)

Voila!


# License

All the source code in the [The Odin Project](https://www.theodinproject.com/courses/ruby-on-rails/lessons/forms) is available jointly under the MIT License and the Beerware License.

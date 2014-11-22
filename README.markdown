# Basic Cost Accounting

This is an app I started putting together a few years back while I was doing an
AAT course in Accounting. It's intended to model a couple of things:

* Figuring out the profitability of items you produce, by taking note of fixed and variable direct costs; and

* calculating when you should reorder stock items, based on the amount of stock
  you typically use, the lead times from suppliers, and the cost of
  ordering/storing the stock.

In practice, I used the latter to calculate the optimum time to restock the beer fridge while I was working at FreeAgent!

## Getting the app running

You'll need Ruby 1.9.x (rbenv will use 1.9.3 if its available) and PostgreSQL. Install gem dependencies with:

    bundle install

then create the database user and migrate the db with:

    createuser -s cost_accounting
    rake db:create:all
    rake db:reset

and run the app server with:

    foreman start

Finally, head to <http://localhost:5000/>, create a user, create a company, and
start adding products.

If you find it a useful starting point for your own project, or have something
you'd like to contribute back, I'd love to hear from you!

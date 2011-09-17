# Basic Cost Accounting

## TODO List

* I actually think this might be useful. Stick a Campaign Monitor on the home
  page and on the sign up to capture email addresses for in the future.

TODO: Insert proper README. In the meantime, here's the initial spec details
from Emily and Graeme.

Taken from: <https://docs.google.com/a/freeagent.com/document/d/1Ho_FSLegh7VxXFy7wykVy-S-ZQ5O5vTZb5DKo7QRiKc/edit?hl=en_US#>

## Emily's initial Spec

### Background

This is less relevant for service-based businesses than for product-based
businesses.

A small business selling goods will need to know how much each line costs to
make, not for cost-plus pricing (daft idea) but to know which lines are
profitable - otherwise they won’t know if it’s worthwhile continuing to make a
given line, or if they should put their prices up. For example, an upholsterer
may find that loose covers for armchairs are more profitable than
made-to-measure curtains.

### Number crunching

Accounting jargon buster:

* Variable costs = costs that vary with the number of products made and sold,
  e.g. the more pairs of curtains the upholsterer makes, the more fabric she
  will need

* Fixed costs = costs that stay the same no matter how much or how little the
  upholsterer does in her business, e.g. rent for her workroom, FreeAgent
  fees, accountants’ fees

How I would see this working would be:

* The user inputs selling price per unit of each product line they sell (e.g.
  for the upholsterer this is 1 pair of curtains = 1 unit, each pair of
  curtains sells for £x)

* They would then need to input the different variable costs per unit (e.g.
  for the upholsterer, one variable cost would be x metres of fabric at £y /
  metre therefore the cost of fabric is £z (£x x £y) per pair of curtains - we
  would allow the user to put in as many variable costs per unit as they
  needed to - this would also need to include a line for the user’s time

* This gives the contribution per unit

I’m not sure we’d need to include fixed costs given that allocation of these
between the different product lines would be arbitrary? Contribution per unit
would give a good indication of how profitable each line is, which is what the
aim of this app would be.

## Graeme's Thoughts

So, we’re looking to model direct costs on a unit item to compare the cost to
produce with the sale price and determine a gross profit for the item. We
could also model indirect costs to give an idea of net profit, but that’s
probably out of scope. So, a customer would have one or more products. The
product will have:

* A description
* A net sale price (so we can figure out profitability)

In addition, we’ll be able to look at different production levels for the
product in order to see how its profitability changes at different production
levels.

Each product will also have one or more direct costs. These direct costs are
costs directly attributable to the creation of that product. They can be
modelled in, offhand, four different ways:

* Fixed cost (eg the purchase of specialist machinery to create a product).

* Pure variable cost, where the cost is a linear function of the production
  level (eg if it costs £50 to produce 10 of these things, then it’ll cost
  £100 to produce 20 of them).

* Stepped costs (eg it'll cost £10 for the first 100 units, £20 for the next
  100 units, etc).

* Semi-variable costs (eg £10 setup plus £2/unit)

That’s all I’ve covered so far anyway. :)

Once we’ve got all the direct costs, we can calculate the profitability for
particular production levels. My feeling is that it would be most interesting
to display this as a graph of unit cost vs production level, showing how the
profitability changes.

Where I think it gets interesting is when you can’t just model your direct
costs with “simple” functions like above, which (except stepped costs) are all
of the form ax+b (the simple cases are where a or b is zero). It gets much
more interesting when you say some raw material costs £x per metre, but you
get a 5% discount if you buy 100m at a time, or 10% if you buy 500m at a time.
But that’s way more complicated because you then want to model responsible
stock levels and, to an extent, cashflow (because you need to know if you can
afford the outlay for the raw materials if you’re going to be able to buy them
in bulk and take advantage of the savings).

But still, a simple modelling tool is pretty simple and would be really
useful.

For the overall picture, showing the cumulative effect of products, plus the
negative effect of indirect costs would give you an idea of the overall
health/profitability of the business.

This is pretty much getting back towards the business planning/cash flow app I
started putting together a business plan for a couple of years ago. :)

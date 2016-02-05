## Project Description

In this project, you will use Rails and ActiveRecord to build a JSON API which exposes the SalesEngine data schema.

The project requirements are listed below:

* [Learning Goals](#learning-goals)
* [Technical Expectations](#technical-expectations)
* [Evaluation](#evaluation)

## <a name="learning-goals"></a> Learning Goals

* Learn how to to build Single-Responsibility controllers to provide a well-designed and versioned API.
* Learn how to use controller tests to drive your design.
* Use Ruby and ActiveRecord to perform more complicated business intelligence.

## <a name="technical-expectations"></a> Technical Expectations

* All endpoints will expect to return JSON data
* All endpoints should be exposed under an `api` and version (`v1`)
namespace (e.g. `/api/v1/merchants.json`)
* JSON responses should included `ids` only for associated records unless otherwise indicated (that is, don't embed the whole associated record, just the id)
* Prices are in cents, therefore you will need to transform them in dollars. (`12345` becomes `123.45`)
* Remember that for a JSON string to be valid, it needs to contain a key and a value.

### Data Importing

* You will create an ActiveRecord model for each
entity included in the [sales engine data](https://github.com/turingschool/sales_engine/tree/master/data).
* Your application should include a rake task which imports all of the CSV's and creates the corresponding records.

### Record Endpoints

#### Index of Record

Each data category should include an `index` action which
renders a JSON representation of all the appropriate records:

`GET /api/v1/merchants.json`

#### Show Record

Each data category should include a `show` action which
renders a JSON representation of the appropriate record:

`GET /api/v1/merchants/1.json`

#### Single Finders

Each data category should offer `find` finders to return a single object representation like this:

```
GET /api/v1/merchants/find?id=12
```

Which would find the one merchant with ID `12`. The finder should work with any of the attributes defined on the data type and always be case insensitive.

For example:

```
GET /api/v1/merchants/find?name=Schroeder-Jerde
```

#### Multi-Finders

Each category should offer `find_all` finders like this:

```
GET /api/v1/merchants/find_all?name=Cummings-Thiel
```

Which would find all the merchants whose name matches this query.

The finder should work with any of the attributes defined on the data type and always be case insensitive.

#### Random

`api/v1/merchants/random.json` returns a random merchant.

### Relationship Endpoints

In addition to the direct queries against single resources, we would like to also be able to pull relationship data from the API.

We'll expose these relationships using nested URLs, as outlined in the sections below.

#### Merchants

* `GET /api/v1/merchants/:id/items` returns a collection of items associated with that merchant
* `GET /api/v1/merchants/:id/invoices` returns a collection of invoices associated with that merchant from their known orders

#### Invoices

* `GET /api/v1/invoices/:id/transactions` returns a collection of associated transactions
* `GET /api/v1/invoices/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/invoices/:id/items` returns a collection of associated items
* `GET /api/v1/invoices/:id/customer` returns the associated customer
* `GET /api/v1/invoices/:id/merchant` returns the associated merchant

#### Invoice Items

* `GET /api/v1/invoice_items/:id/invoice` returns the associated invoice
* `GET /api/v1/invoice_items/:id/item` returns the associated item

#### Items

* `GET /api/v1/items/:id/invoice_items` returns a collection of associated invoice items
* `GET /api/v1/items/:id/merchant` returns the associated merchant

#### Transactions

* `GET /api/v1/transactions/:id/invoice` returns the associated invoice

#### Customers

* `GET /api/v1/customers/:id/invoices` returns a collection of associated invoices
* `GET /api/v1/customers/:id/transactions` returns a collection of associated transactions

### Business Intelligence Endpoints

We want to maintain the original Business Intelligence functionality
of SalesEngine, but this time expose the data through our API.

Remember that ActiveRecord is your friend. Much of the complicated logic
from your original SalesEngine can be expressed quite succinctly
using ActiveRecord queries.

#### All Merchants

* `GET /api/v1/merchants/most_revenue?quantity=x` returns the top `x` merchants ranked by total revenue
* `GET /api/v1/merchants/most_items?quantity=x` returns the top `x` merchants ranked by total number of items sold
* `GET /api/v1/merchants/revenue?date=x` returns the total revenue for date `x` across all merchants

Assume the dates provided match the format of a standard ActiveRecord timestamp.

#### Single Merchant

* `GET /api/v1/merchants/:id/revenue` returns the total revenue for that merchant across all transactions
* `GET /api/v1/merchants/:id/revenue?date=x` returns the total revenue for that merchant for a specific invoice date `x`
* `GET /api/v1/merchants/:id/favorite_customer` returns the customer who has conducted the most successful transactions
* `GET /api/v1/merchants/:id/customers_with_pending_invoices` returns a collection of customers which have pending (unpaid) invoices

_NOTE_: Failed charges should never be counted in revenue totals or statistics.

_NOTE_: All revenues should be reported as a float with two decimal places.

#### Items

* `GET /api/v1/items/most_revenue?quantity=x` returns the top `x` items ranked by total revenue generated
* `GET /api/v1/items/most_items?quantity=x` returns the top `x` item instances ranked by total number sold
* `GET /api/v1/items/:id/best_day` returns the date with the most sales for the given item using the invoice date

#### Customers

* `GET /api/v1/customers/:id/favorite_merchant` returns a merchant where the customer has conducted the most successful transactions

# F.A.Q. #

## General ##

ToDo.

## Payment Processor ##

#### Why are you using Stripe as a payment processor and not PayPal / Braintree / Payment Express or anything else? ####

There are ultimately two reasons why we decided to go with Stripe.

The first reason we decided on Stripe above all others is because their interfaces for all vested parties is
excellent. The end-user experience is the best we have come across. Their dashboard for the account itself is clean,
crisp, and clear. And finally the docs, API, and provided libraries for the developer is the best in class.

The second reason we decided to concentrate on only one payment processor is because they all provide their service in
subtly different ways even though they all provide a similar service.  Most of the complicated logic in our app lies
with talking to the payment processor, hence by keeping us focussed on only one we can keep our application smaller,
more stable, and as reliable as we can.

#### What do I need to do to set myself up with Stripe? ####

Please see their documentation for more details. (ToDo: provide a link here.)

(Ends)

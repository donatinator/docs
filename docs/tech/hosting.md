# Hosting #

Currently, the Donatinator can be hosted on various different PaaS solutions such as Heroku or OpenShift, run on your
own server, or run through a container orchestration framework such as Kubernetes (coming soon) or Nomad (coming soon).

## Pre-Requisites ##

The first (and only) thing you need is a Stripe account, your
[API keys](https://dashboard.stripe.com/account/apikeys)
(publishable key and secret key), and the signing secret from your
[webhook](https://dashboard.stripe.com/account/webhooks)
configuration.

## Heroku ##

There are three ways you can set up your app on Heroku. This may depend on how technical you are, or whether you prefer
a one-click install, clicking around the Heroku Dashboard, or doing everything via the command line (or a combination
of all these).

## Via the One Click Install ##

ToDo.

## Via the Heroku Dashboard ##

Firstly, head into your [Heroku Dashboard](https://dashboard.heroku.com/apps) and create a new app.

From here, you set the following environment variables in the settings tab:

* STRIPE_PUBLIC_KEY
* STRIPE_SECRET_KEY
* STRIPE_ENDPOINT_SECRET
* DATABASE_URL

For this last config var, you also need to provision a database on the 'Resources' page of your app, by clicking on
'Add-ons' and searching for Heroku Postgres. For now, just choose a **HobbyDev - Free** plan.

Once you've done the above, you need to clone the Donatinator code, set up the remote (use your own app name instead of `furry-goat-123`), and finally push to Heroku:

```
$ git clone https://gitlab.com/donatinator/donatinator.git
$ cd donatinator
$ heroku git:remote -a furry-goat-123
$ git push heroku master
```

You may need to read the
[Git article on the Heroku docs](https://devcenter.heroku.com/articles/git)
for more information.

Please
[let us know](https://gitlab.com/donatinator/docs/issues)
how you get on with these instructions.

### Via CLI ###

You can perform most of the above using the command line. ToDo.

(Ends)

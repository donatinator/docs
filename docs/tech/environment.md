# Environment #

The following environment variables are required to be set when starting The Donatinator.

### PORT ###

Specifies what port the webserver should listen on (default: 3000).

Depending on your hosting this may be provided by the platform. If you host yourself you should provide it in the
script or environment you use to start the server. For example the Heroku platform provides this to your app directly
every time your server starts.

### NODE_ENV ###

In general you should set this to `production`. Any other value is not supported by us.

### STRIPE_PUBLIC_KEY ###

Your Stripe Publishable Key.

e.g. `pk_live_abc123`

### STRIPE_SECRET_KEY ###

Your Stripe Secret Key.

e.g. `sk_live_abc123`

### STRIPE_ENDPOINT_SECRET ###

The endpoint secret as specified when you set up a Stripe Webhook from within Stripe.

e.g. `whsec_abc123`

Note: you can set up multiple endpoints in Stripe, so this is specific to the endpoint on your Donatinator app.

### DATABASE_URL ###

Specifies the fully qualified database URL your app's database resides on.

e.g. `postgres://username:password@host:5432/database-name`

This is set automatically by the Heroku platform when you provision a Postgres add-on. You'll have to set this if you are hosting your app yourself.

(Ends)

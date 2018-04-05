# Getting Started #

There are a few different ways you can deploy The Donatinator. For this mini-guide to get you started, we're going to
deploy onto Heroku using their free-plan, and their free database tier.

We'll be setting up a site for a fictional charity called "Save our Pencils", and the project will just be called
`pencils`.

## Clone the repo from GitLab ##

The first thing to do is get a copy of the code. This guide assumes you already have `git` installed locally. Let's
clone the public Git endpoint into a directory called `donate`:

```
$ git clone https://gitlab.com/donatinator/donatinator.git pencils
Cloning into 'pencils'...
remote: Counting objects: 791, done.
remote: Compressing objects: 100% (278/278), done.
remote: Total 791 (delta 525), reused 750 (delta 497)
Receiving objects: 100% (791/791), 293.65 KiB | 0 bytes/s, done.
Resolving deltas: 100% (525/525), done.
Checking connectivity... done.
```

And head into that directory for the rest of this guide:

```
$ cd pencils
```

That's all that is needed locally to be able to push to Heroku. You don't even need to install any npm dependencies
since Heroku will do that during the build phase. We'll be adding the remote Heroku repo shortly.

## Create a Project on Heroku ##

This guide assumes you have a Heroku account and have installed the Heroku CLI tool locally. We also assume you have set it up correctly which you can check with the following command:

```
$ heroku apps
=== andychilton@gmail.com Apps
donatinator
```

As you can see I already have one app which is the demo app using Stripe's test credentials. So let's create another
one for our fictional charity. Also see Heroku's docs on
[Creating an App](https://devcenter.heroku.com/articles/creating-apps).

```
$ heroku apps:create pencils
Creating ⬢ pencils... done
https://pencils.herokuapp.com/ | https://git.heroku.com/pencils.git
```

And let's check it is now listed:

```
$ heroku apps
ryloth:~<>$ heroku apps
=== andychilton@gmail.com Apps
donatinator
pencils
```

You'll also see that the previous command has added a Git remote to your local `.git/config` file:

```
$ cat .git/config
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[remote "origin"]
	url = https://gitlab.com/donatinator/donatinator.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
[remote "heroku"]
	url = https://git.heroku.com/pencils.git
	fetch = +refs/heads/*:refs/remotes/heroku/*
```

We'll be using this when we want to push our code to Heroku, or when we want to push a new update.

## Create a Postgres Database ##

Since Heroku also has a free tier for their database offering, we'll use that here. It is noted that they deem the free
tier to be non-production, however for the purposes of this guide we'll set it up as such. It is up to you to determine
if this will fulfill your requirements for your project.

```
$ heroku addons:create heroku-postgresql:hobby-dev
Creating heroku-postgresql:hobby-dev on ⬢ pencils... free
Database has been created and is available
 ! This database is empty. If upgrading, you can transfer
 ! data from another database with pg:copy
Created postgresql-concave-123456 as DATABASE_URL
Use heroku addons:docs heroku-postgresql to view documentation
```

Awesome. It's telling us that the database is empty, and for now that's okay since the schema will be set up the first
time Donatinator starts up.

Now, for the first time, let's have a look at the current config so you can see the `DATABASE_URL` that was set up in the previous command:

```
$ heroku config
=== pencils Config Vars
DATABASE_URL: postgres://user:pass@ec2-1-2-3-4.compute-1.amazonaws.com:5432/db-name
```

Perfect, since Donatinator will read the `DATABASE_URL` automatically on startup.

## Set up some environment variables ##

The first one you're going to set up is a session key for your cookies which are used when your admin staff log
in. This one is pretty easy to set, so we'll do that first before moving on to your Stripe credentials.

Firstly, let's generate a session key, then set it in your environment:

```
$ pwgen -s 32 1
JPx58tdfC4a2ernbsvBRuXp5d0eH5s6T
$ heroku config:set SESSION_KEY=JPx58tdfC4a2ernbsvBRuXp5d0eH5s6T
Setting SESSION_KEY and restarting ⬢ pencils... done, v4
SESSION_KEY: JPx58tdfC4a2ernbsvBRuXp5d0eH5s6T
```

There are now three other env vars we're going to set and you'll have to log in to your Stripe account to get them.
Just remember to use either the test keys if you're just setting up a test instance, or use your live keys if you're
setting up your donor portal for real.

The three keys you'll eventually need are `STRIPE_PUBLIC_KEY`, `STRIPE_SECRET_KEY`, and `STRIPE_ENDPOINT_SECRET` but
we'll skip the latter for now, since that is used for Stripe sending us webhooks which we'll set up later. Using the
same command as before, but setting the public and secret keys at the same time:

```
$ heroku config:set STRIPE_PUBLIC_KEY=pk_test_... STRIPE_SECRET_KEY=sk_test_...
Setting SESSION_KEY and restarting ⬢ pencils... done, v5
STRIPE_PUBLIC_KEY: pk_test_...
STRIPE_SECRET_KEY: sk_test_...
```

If you want to check these are correct, list your config again where you'll see all four we have set above:

```
$ heroku config
DATABASE_URL:      postgres://user:pass@ec2-1-2-3-4.compute-1.amazonaws.com:5432/db-name
SESSION_KEY:       JPx58tdfC4a2ernbsvBRuXp5d0eH5s6T
STRIPE_PUBLIC_KEY: pk_live_...
STRIPE_SECRET_KEY: sk_live_...
```

Awesome! We're almost there.

## Pushing new Code ##

Since we added the `heroku` remote to your Git config, we can now push the latest code up to Heroku, to build and deploy for us. Here's a short command with a long output. You don't have to read it all, but hopefully it'll all work the same for you:

```
$ git push heroku master
Counting objects: 793, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (252/252), done.
Writing objects: 100% (793/793), 293.85 KiB | 0 bytes/s, done.
Total 793 (delta 526), reused 791 (delta 525)
remote: Compressing source files... done.
remote: Building source:
remote:
remote: -----> Node.js app detected
remote:
remote: -----> Creating runtime environment
remote:
remote:        NPM_CONFIG_LOGLEVEL=error
remote:        NODE_VERBOSE=false
remote:        NODE_ENV=production
remote:        NODE_MODULES_CACHE=true
remote:
remote: -----> Installing binaries
remote:        engines.node (package.json):  unspecified
remote:        engines.npm (package.json):   unspecified (use default)
remote:
remote:        Resolving node version 8.x...
remote:        Downloading and installing node 8.11.1...
remote:        Using default npm version: 5.6.0
remote:
remote: -----> Restoring cache
remote:        Skipping cache restore (not-found)
remote:
remote: -----> Building dependencies
remote:        Installing node modules (package.json + package-lock)
remote:
remote:        > bcrypt@1.0.3 install /tmp/build_e06a5c16754f5a622f4633f4f5e8bd28/node_modules/bcrypt
remote:        > node-pre-gyp install --fallback-to-build
remote:
remote:        [bcrypt] Success: "/tmp/build_e06a5c16754f5a622f4633f4f5e8bd28/node_modules/bcrypt/lib/binding/bcrypt_lib.node" is installed via remote
remote:        added 277 packages in 6.699s
remote:
remote: -----> Caching build
remote:        Clearing previous node cache
remote:        Saving 2 cacheDirectories (default):
remote:        - node_modules
remote:        - bower_components (nothing to cache)
remote:
remote: -----> Pruning devDependencies
remote:        Skipping because npm 5.6.0 sometimes fails when running 'npm prune' due to a known issue
remote:        https://github.com/npm/npm/issues/19356
remote:
remote:        You can silence this warning by updating to at least npm 5.7.1 in your package.json
remote:        https://devcenter.heroku.com/articles/nodejs-support#specifying-an-npm-version
remote:
remote: -----> Build succeeded!
remote: -----> Discovering process types
remote:        Procfile declares types     -> (none)
remote:        Default types for buildpack -> web
remote:
remote: -----> Compressing...
remote:        Done: 22.8M
remote: -----> Launching...
remote:        Released v6
remote:        https://pencils.herokuapp.com/ deployed to Heroku
remote:
remote: Verifying deploy... done.
To https://git.heroku.com/pencils.git
 * [new branch]      master -> master
```

And finally, you can now open your instance in your browser:

```
$ heroku open
```

You app should look something like this:

[![donatinator-getting-started-initial.png](https://s31.postimg.org/5hrs4r74b/donatinator-getting-started-initial.png)](https://postimg.org/image/4fhlm7oav/)

If so, congratulations! Your setup is working but not quite complete. And yay, you already have a secure site almost
ready to take donations.

Since we haven't set the `STRIPE_ENDPOINT_SECRET` config var yet, this screen appears just to remind you what else you
have to do.

(Ends)

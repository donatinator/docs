# Donatinator RFCs #

Many features, bug fixes or documentation improvements can be implemented and reviewed via the normal GitLab pull
request workflow (see [Contributing](https://donatinator.org/about/contributing/) for more information).

However some changes are more substantial or backwards incompatible.

The "RFC" (request for comments) process is intended to provide a consistent and controlled path for these features to
enter the project.

## Why we have this process ##

In the case where a feature or bug fix is substantial or is backwards incompatible, then it is harder to determine both
the viability of the changes or whether they are actually a good idea. To be able to do this, we need multiple members
of the community to read, review, and comment on the proposal.

This process is intended to help reach consensus on any feature that would affect the core ability to accept both
single and recurring donations.

Only by doing this can we ensure the best outcome for everyone using The Donatinator.

## When you need to follow this process ##

You need to follow this process if you intend to make changes to any of The Donatinators code or docs that result in a
significant change or a backwards incompatible change. This may include some of the following though this list is not
exhaustive:

* When changing web client code which helps accept donations.
* When calling a Stripe API that deals with any kind of charge and/or subscription.
* When performing a destructive database schema change.

Some changes do not require an RFC and those may go through the regular pull request process. If a PR is deemed to be
significant or backwards incompatible, then the issue may be closed with a polite request suggesting an RFC is raised
instead.

## Gathering Feedback ##

It's often helpful to gather feedback before diving too deeply into your new concept, just in case someone knows how to
solve it with the current release or with a small easy patch. This can save time for all concerned.

Once you're convinced that this feature **is** required, it's also helpful to obtain feedback prior to submitting your
RFC. You may open an issue in the [RFC repo](https://gitlab.com/donatinator/rfcs) to start a high-level discussion,
with the goal of eventually opening an RFC pull request with all the details gathered together in one document.

## The RFC Process ##

There is a pre-process (hinted at above) and then the process itself.

As hinted at above, you can perform initial data gathering, obtain feedback, and perform some analysis. You may create
an issue so that everyone on the project can see it and help you gather what you need. This step is optional. You may
go straight into the process itself.

* Fork the [RFC repo](https://gitlab.com/donatinator/rfcs) repo
* Copy `YYYYMMDD-template.md` file to `1-incoming/20170906-my-feature.md` (fill in todays date and `my-feature`
  describes your feature in a few words)
* Fill in the RFC. Put care into the details: **RFCs that do not present convincing motivation, demonstrate
  understanding of the impact of the design, or are disingenuous about the drawbacks or alternatives tend to be
  poorly-received**.
* Submit a pull request (with a 'Closes #nnn' of the issue number used for initial feedback).
* As an RFC in the `reviewing` stage, it will be moved from `1-incoming` to `2-reviewing` under a new pull request for
  discussion. It will now receive design feedback from the larger community. This PR will link back to the initial data
  gathering ticket, as well as the pull request ticket.
* Under the new `reviewing` issue, build consensus and integrate feedback. RFCs that have broad support are much more
  likely to make progress than those that don't receive any comments. The author should be prepared to revise their
  pull request with additional commits in response to any feedback received.
* Eventually, the core team will decide whether the RFC is a candidate for inclusion into The Donatinator.
* RFCs that are candidates for inclusion in The Donatinator will enter a "final comment period" lasting 7 days. The
  beginning of this period will be signaled with a comment such as "Final comment period." and label on the RFC's pull
  request. Furthermore, [The Donatinator's official Twitter account](https://twitter.com/TheDonatinator) will post a
  tweet about the RFC to attract the community's attention.
* An RFC can be modified based upon feedback from the core team and community. Significant modifications may trigger a
  new final comment period.
* An RFC may be rejected by the core team after public discussion has settled and comments have been made summarizing
  the rationale for rejection. A member of the core team should then close the RFC's associated pull request.
* An RFC may be accepted at the close of its final comment period. A core team member will merge the RFC's associated
  pull request, at which point the RFC will become 'active'.

If accepted, the `reviewing` PR will be updated to move the RFC to `3-accepted`. If not it'll be moved to
`5-rejected`. Once the RFC has been accepted, anyone (not just the original proposer) can start to implement it. If the RFC is being actively worked on, it'll stay in the `3-accepted` stage.

## The RFC Life-Cycle ##

Once an RFC becomes active then authors may implement it and submit the feature as a pull request to
[The Donatinator repo](https://gitlab.com/donatinator/donatinator). Moving to the `accepted` state is not a rubber
stamp, and in particular still does not mean the feature will ultimately be merged; it does mean that the core team has
agreed to it in principle and are amenable to merging it.

Furthermore, the fact that a given RFC has been accepted implies nothing about what priority is assigned to its
implementation, nor whether anybody is currently working on it. If you're interested, it is worth asking around to see
if anybody has an active interest in the RFC at any level.

Modifications to accepted/in-progress RFC's can be done in followup PR's. We strive to write each RFC in a manner that
it will reflect the final design of the feature; but the nature of the process means that we cannot expect every merged
RFC to actually reflect what the end result will be at the time of the next major release; therefore we try to keep
each RFC document somewhat in sync with the language feature as planned, tracking such changes via followup pull
requests to the document.

## Implementing an RFC ##

The author of an RFC is not obligated to implement it. Of course, the RFC author (like any other developer) is welcome
to post an implementation for review after the RFC has been accepted.

If you are interested in working on the implementation for an 'active' RFC, but cannot determine if someone else is
already working on it, feel free to ask (e.g. by leaving a comment on the associated issue).

## Reviewing RFC's ##

At regular intervals, the core team will attempt to review whatever is currently in the RFC repo. This may involve
moving things along, providing feedback, or rejecting them entirely.

## Credits ##

Thanks to the following projects for having RFC processes that we were able to build on for our own process:

* https://github.com/yarnpkg/rfcs
* https://github.com/rust-lang/rfcs
* https://github.com/emberjs/rfcs

(Ends)

# MctNuke

Backend for OpenMCT to support pulling data from Nucleares, a nuclear reactor
simulation game.

You'll also want [my fork of OpenMCT](https://github.com/wisq/openmct). This
contains a fully working OpenMCT build with the Nucleares plugin ready to go.

For any of this data to be very useful, you'll also need to make some graphs,
dashboards, etc.  The [examples directory](examples) contains some JSON objects
you can use as a starting point.

If you'd like a demo, check out [my own website](https://nucleares.wisq.net/)
which will have real data from my most recent session of the game.  If it's
updating in realtime, that means I'm playing the game right now!  Feel free to
import JSON objects (e.g. [the dashboard I use](examples/dashboard.json)) — all
OpenMCT objects are stored in your browser's local storage, you're not actually
messing with my site at all.

switchboard
========

sample management and publishing software for the Teenage Engineering OP-1

![switchboard](switchboard.png)

0.1 - basics and sets
===
- [x] scaffold with gulp, famo.us, and atom-shell
- [ ] build a synth "set"
- [ ] build a drum "set"
- [ ] load local samples
- [ ] detect op-1 connection
- [ ] upload "sets" to the OP-1

0.11
===
- [ ] drag and drop to add files
- [ ] save and load sets
- [ ] preview local samples
- [ ] prompt to rename and save new snapshots

0.2 - sample discovery
===
- [ ] consolidate samples from operator-1 forums and old forums to switchboard.io (or available)
- [ ] find samples directly through switchboard
- [ ] publish saved presets to switchboard

0.3 - publishing
===
- [ ] save and restore tape tracks
- [ ] trim whitespace
- [ ] link account and upload to soundcloud


notes
===

passable progress bars currently require a patch to the famo.us GridLayout to [remove the rounding here](https://github.com/Famous/famous/blob/master/src/views/GridLayout.js#L57)
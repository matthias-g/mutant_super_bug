# Reproduction for Mutant/Unparser bug

Check out the repository, then run `./run`

The script will install the dependencies, then run a version of the tests that
crashes, followed by a version of the tests that does not crash.

## Analysis

The diff between the two is below:

```diff
13c13
<     Time.at(to_i + EPOCH_TIME)
---
>     Time.at(self.to_i + EPOCH_TIME)
```

By adding the explicit receiver, the mutation is able to emit the change without
the crash.

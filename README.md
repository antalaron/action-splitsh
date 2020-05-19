Splitsh-lite Github action
==========================

Synchronises a split repository using splitsh-lite

Documentation
-------------

It's primary use is to create a split branch and push it to the parent.

The action requires the following inputs:

Key                | Description
------------------ | -----------------------------------------------------------
`split` *          | Subtree repository name (including owner)
`split_deploy_key` | A public key part of a Deploy Key on the split repository
`split_branch`     | Branch name to split
`split_prefix`     | The directory to perform the split on
`split_only_if`    | (`0`, `1` or repository name, default `1`) Pushes only if the origin is this, or `1`

The * indicates mandatory input.

Example usage
-------------

```yaml
name: Release Split

on: [ push ]

jobs:
    release:
        runs-on: ubuntu-latest
        steps:
            -
                name: Checkout
                uses: actions/checkout@v2
                with:
                    fetch-depth: 0
            -
                name: Release
                uses: antalaron/action-splitsh@master
                with:
                    split: 'owner/sub-repo'
                    split_deploy_key: ${{ secrets.GITHUB_SSH_KEY }}
                    split_prefix: 'src/sub-repo/'
```

License
-------

This library is under [MIT License](http://opensource.org/licenses/mit-license.php).

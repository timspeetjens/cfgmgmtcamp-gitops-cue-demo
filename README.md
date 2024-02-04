# GitOps with CUE - Demo

## Commands

Validate sources
```sh
$ cue vet ./src/...
```

Evaluate and print internal json representation.
Empty values will be displayd as their type
```sh
$ cue eval ./src/...
```

Evaluate and fail when non-concrete values exist
```sh
$ cue eval -c ./src/...
```

Run the generation tool
```sh
$ cue cmd generate ./src/...
```

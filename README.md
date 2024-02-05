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

## Preparation

Init the CUE module

```sh
$ cue mod init cfgmgmtcamp.eu/cue/gitops
```

Add API validations for K8s (OpenShift validation omitted)

Init go module
```sh
$ go mod init demo
```

Download go code
```sh
$ go get k8s.io/api/apps/v1@v0.26.12

go: downloading k8s.io/api v0.26.12
go: downloading k8s.io/apimachinery v0.26.12
...
```

Generate CUE definitions
```sh
$ cue get go k8s.io/api/apps/v1

$ tree -L 5 .

.
├── cue.mod
│   ├── gen
│   │   └── k8s.io
│   │       ├── api
│   │       │   ├── apps
│   │       │   └── core
│   │       └── apimachinery
│   │           └── pkg
│   ├── module.cue
│   ├── pkg
│   └── usr
├── go.mod
├── go.sum
└── README.md

11 directories, 4 files
```

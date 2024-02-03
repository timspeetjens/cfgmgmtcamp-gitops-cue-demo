package demo

import (
	"tool/exec"
	"tool/cli"
	"encoding/yaml"
	"tool/file"
	"strings"
)

apiObjectTypes: [
	configMap,
	deployment,
	route,
	service,
]

command: generate: {
	start: cli.Print & {
		text: "Starting generation..."
	}

	cleanup: exec.Run & {
		$dep: start.$done
		cmd: ["find", "./output", "-name", "*.yaml", "-exec", "rm", "{}", ";"]
	}

	{
		for apiObjectType in apiObjectTypes
		for cluster, i in apiObjectType
		for stack, j in i
		for namespace, k in j {
			let fpath = "./output/\(cluster)/\(stack)/\(namespace)"

			"mkdir_\(fpath)": file.MkdirAll & {
				path: fpath
				$dep: cleanup.$done
			}

			for name, obj in k {
				let fname = "\(strings.ToLower(obj.kind))-\(name).yaml"
				"write_\(fpath)/\(fname)": file.Create & {
					filename: "\(fpath)/\(fname)"
					contents: strings.Join(["---", yaml.MarshalStream([obj])], "\n")
					$dep: command.generate["mkdir_\(fpath)"].$done
				}

				"wrote_\(fpath)_\(fname)": cli.Print & {
					text: "\(fpath)/\(fname)"
					$dep: command.generate["write_\(fpath)/\(fname)"]
				}
			}
		}
	}

	goodbye: cli.Print & {
		text: "Finished!"
		$dep: [
			for n, t in command.generate
			if n =~ "^wrote_" {
				t.$done
			},
		]
	}
}

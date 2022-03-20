package main

import (
	"bufio"
	"log"
	"os"
	"strconv"
	"strings"
	"text/template"
)

type VmSpec struct {
	VmName    string
	OsVariant string
	Memory    int
	UserName  string
	Password  string
	WithIso   bool
	WithOvs   bool
}

func main() {
	if len(os.Args) != 2 {
		log.Fatalln("Usage: ./virt-install <vm-spec-file>")
	}

	file, err := os.Open(os.Args[1])
	if err != nil {
		log.Fatalln(err)
	}
	defer file.Close()

	vmSpec := VmSpec{}

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		if err := scanner.Err(); err != nil {
			log.Fatalln(err)
		}
		line := scanner.Text()
		spec := strings.Split(line, "=")
		if spec[0] == "VM_NAME" {
			vmSpec.VmName = spec[1]
		} else if spec[0] == "OS_VARIANT" {
			vmSpec.OsVariant = spec[1]
		} else if spec[0] == "USERNAME" {
			vmSpec.UserName = spec[1]
		} else if spec[0] == "PASSWORD" {
			vmSpec.Password = spec[1]
		} else if spec[0] == "MEMORY" {
			vmSpec.Memory, _ = strconv.Atoi(spec[1])
		} else if spec[0] == "WITHISO" {
			vmSpec.WithIso, _ = strconv.ParseBool(spec[1])
		} else if spec[0] == "WITHOVS" {
			vmSpec.WithOvs, _ = strconv.ParseBool(spec[1])
		} else {
			log.Fatalln("Incorrect spec-file")
		}
	}

	template, err := template.ParseFiles("virt-install.template")
	if err != nil {
		log.Fatalln(err)
	}
	template.Execute(os.Stdout, &vmSpec)
}

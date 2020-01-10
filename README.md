# EvoSuite (un)common behavior test generation evaluation tool (docker)
This repository contains the file structure needed to execute the experiment for the common/uncommon
behavior extension for EvoSuite, using Docker. It also contains a helper script for PowerShell and
Bash to download (if not downloaded already) and run the docker image.

## Running the experiment
To run the experiment, do the following.

1. Clone this repository
2. Place the execution count file that you want to use in the exec_counts folder
3. Install [Docker](https://www.docker.com/). The procedure for this differs between operating
    systems.
4. Run one of the following commands within the repository you cloned to start running the
experiment using either PowerShell or Bash. (note that it is possible to run the `docker run`
command manually using different settings, but only the settings used in the run files have been
tested).

For PowerShell:
```powershell
powershell.exe -ExecutionPolicy Bypass -File .\run.ps1 $iterations $classes_file $process_limit `
$search_budget $exec_count_file
```

For Bash:
```shell script
./run.sh $iterations $classes_file $process_limit $search_budget $exec_count_file
```

Parameter explanation:
- `$iterations`: Number of times tests should be generated for the same class using the same
configuration.
- `$classes_file`: Path to the file containing classes for which tests should be generated. See [the
main GitHub repository of the tool](https://github.com/Bjorn48/cubtg-es-evaluation) for more
information about the format of this file.
- `$process_limit`: The maximum number of EvoSuite processes that may be running at once.
Note that EvoSuite by default spawns two processes (master and client) for each execution.
- `$search_budget`: The search budget to be used by EvoSuite.
- `$exec_count_file`: Path to the execution count file.

The command will download the docker image from [Docker Hub](https://hub.docker.com/) and start a
corresponding container. It is also possible to build a custom Docker image using the Dockerfile in
the [the main GitHub repository of the tool](https://github.com/Bjorn48/cubtg-es-evaluation).

Local directories are bound to the docker container using the used `--mount` option. These are the
folders contained in this repository. They will contain the output of the experiment. See [the
main GitHub repository of the tool](https://github.com/Bjorn48/cubtg-es-evaluation) for more details
about the output.

By default, the docker container will run in the foreground. To make it run in the background, enter
`^P^Q`. It can then be returned to the foreground using the `docker attach <container_name>` command.
To find out the container name, run `docker container ls` to list all running containers.

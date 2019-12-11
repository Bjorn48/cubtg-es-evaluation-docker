# Common/Uncommon behavior test generation EvoSuite evaluation with Docker
This repository contains the file structure needed to execute the experiment for the Common/Uncommon
behavior extension for EvoSuite, using Docker.

## Running the experiment
To run the evaluation, do the following.

1. Clone this repository
2. Place the execution count file that you want to use in the exec_counts folder
3. Install [Docker](https://www.docker.com/)
4. Run the following command (*this command works only on Windows*):
```shell script
docker run -it --rm --mount type=bind,source="${pwd}\analysis-result",target=/app/analysis-result \
--mount type=bind,source="${pwd}\consoleLog",target=/app/consoleLog \
--mount type=bind,source="${pwd}\evosuite-report",target=/app/evosuite-report \
--mount type=bind,source="${pwd}\generated_tests",target=/app/generated_tests \
--mount type=bind,source="${pwd}\logs",target=/app/logs \
--mount type=bind,source="${pwd}\results",target=/app/results \
--mount type=bind,source="${pwd}\exec_counts",target=/app/exec_counts \
beversnl/es-model-seeding:0.1-SNAPSHOT $rounds classes_jabref.csv $concurrent_processes 1 \
1 1 $exec_counts_file
```
Variable explanation:
- `$rounds`: number of times to execute the experiment (for each class)
- `$concurrent_processes`: number of EvoSuite java processes that may be running at the same time
- `$exec_counts_file`: path to the execution count file to be used for test generation

The command will download the docker image from [Docker Hub](https://hub.docker.com/) and spawn a
corresponding container. It is also possible to build a custom Docker image using the Dockerfile in
the [repository containing the experiment execution code](https://github.com/Bjorn48/cubtg-es-evaluation).

Local directories are bound to the docker container using the used `--mount` option. These are the
folders contained in this repository. They will contain the output of the experiment.

By default, the docker container will run in the foreground. To make it run in the background, enter
`^P^Q`. It can then be returned to the foreground using the `docker attach <container_name>` command.
To find out the container name, run `docker container ls` to list all running containers.

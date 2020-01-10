$iterations=$args[0]
$classes_file=$args[1]
$process_limit=$args[2]
$search_budget=$args[3]
$exec_count_file=$args[4]

docker run -it --rm --mount type=bind,source="${pwd}\analysis-result",target=/app/analysis-result `
--mount type=bind,source="${pwd}\consoleLog",target=/app/consoleLog `
--mount type=bind,source="${pwd}\evosuite-report",target=/app/evosuite-report `
--mount type=bind,source="${pwd}\generated_tests",target=/app/generated_tests `
--mount type=bind,source="${pwd}\logs",target=/app/logs `
--mount type=bind,source="${pwd}\results",target=/app/results `
--mount type=bind,source="${pwd}\exec_counts",target=/app/exec_counts `
beversnl/cubtg-es-evaluation:1.0.0 $iterations $classes_file $process_limit $search_budget $exec_count_file

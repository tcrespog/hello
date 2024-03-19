#!/usr/bin/env nextflow

process sayHello {
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
}

workflow {
  // Create input channel from input file provided through params.input
  Channel.fromPath(params.input).splitText().map { it.trim() } | sayHello | view
}

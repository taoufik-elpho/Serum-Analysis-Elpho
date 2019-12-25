#!/usr/bin/env nextflow
/*
 * Authors:
 *      Taoufik Bensellak
 *
 *  2019
 *
 *
 * Description  : Nextflow pipeline for SUI
 *
*/
SAMPLES = params.samples.split(',')
CH_SAMPLES = Channel.from(SAMPLES)
process Combine_Engines {
    
    tag "COMB"
    input:
        val vsample from CH_SAMPLES
    output:
        file 'FDR_Protein_Peptide_Identification.csv' into fdroutscombined
    script:
        """
      Rscript /home/taoufik/data/combiningpipeline/Combining.R  sample ${vsample}
      cp FDR_Protein_Peptide_Identification.csv "${params.outdir}/COMBINING/${vsample}_FDR_Protein_Peptide_Identification.csv" 
        """
}
workflow.onComplete {
    def subject = 'SUI'
    def recipient = 'taoufik.bensellak@gmail.com'

    ['mail', '-s', subject, recipient].execute() << """

    Pipeline execution summary
    ---------------------------
    Completed at: ${workflow.complete}
    Duration    : ${workflow.duration}
    Success     : ${workflow.success}
    workDir     : ${workflow.workDir}
    exit status : ${workflow.exitStatus}
    Error report: ${workflow.errorReport ?: '-'}
    """
}

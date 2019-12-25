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
in_dir = file(params.indir)
in_dir_comet = file("${params.indir}/SearchGui/COMET")
in_dir_xtandem = file("${params.indir}/SearchGui/XTANDEM")
in_dir_msgf = file("${params.indir}/SearchGui/MSGF")
in_dir_myrimatch = file("${params.indir}/SearchGui/MYRIMATCH")
println "Identification of Peptides and proteins"
incomet = []
inxtandem = []
inmsgf = []
inmyrimatch = []
in_dir_comet.eachFile { item ->
    if( item.isFile() ) {
        println "${item.getName()} - size: ${item.size()}"
        incomet << [item.getName(), item]
    }
    else if( item.isDirectory() ) {
        println "${item.getName()} - DIR"
    }
}
in_dir_xtandem.eachFile { item ->
    if( item.isFile() ) {
        println "${item.getName()} - size: ${item.size()}"
        inxtandem << [item.getName(), item]
    }
    else if( item.isDirectory() ) {
        println "${item.getName()} - DIR"
    }
}
in_dir_msgf.eachFile { item ->
    if( item.isFile() ) {
        println "${item.getName()} - size: ${item.size()}"
        inmsgf << [item.getName(), item]
    }
    else if( item.isDirectory() ) {
        println "${item.getName()} - DIR"
    }
}
in_dir_myrimatch.eachFile { item ->
    if( item.isFile() ) {
        println "${item.getName()} - size: ${item.size()}"
        inmyrimatch << [item.getName(), item]
    }
    else if( item.isDirectory() ) {
        println "${item.getName()} - DIR"
    }
}
chcomet = Channel.from(incomet)
chmsgf = Channel.from(inmsgf)
chxtandem = Channel.from(inxtandem)
chmyrimatch = Channel.from(inmyrimatch)

process identify_comet {

    tag "Comet"
    input:
        set val(mgfbn), file(mgf) from chcomet
    output:
        file 'FDR_Protein_Peptide_Identification.csv' into fdroutscomet
    script:
        """
        Rscript /home/taoufik/data/identification.R  file "${params.indir}/SearchGui/COMET/${mgfbn}" engine "comet"  
       cp FDR_Protein_Peptide_Identification.csv "${params.outdir}/COMET/${mgfbn}_FDR_Protein_Peptide_Identification.csv" 
       cp Protein_Peptide_Identification.csv "${params.outdir}/COMET/${mgfbn}_Protein_Peptide_Identification.csv" 
         
        """
}
process identify_msgf {
    //conda 'peptide-shaker searchgui zip'
    tag "MSGF"
    input:
        set val(mgfbn), file(mgf) from chmsgf
    output:
        file 'FDR_Protein_Peptide_Identification.csv' into fdroutsmsgf
    script:
        """
       Rscript /home/taoufik/data/ParsingEnginesResults.R  file "${params.indir}/SearchGui/MSGF/${mgfbn}" engine "msgf" 
      cp FDR_Protein_Peptide_Identification.csv "${params.outdir}/MSGF/${mgfbn}_FDR_Protein_Peptide_Identification.csv" 
      cp Protein_Peptide_Identification.csv "${params.outdir}/MSGF/${mgfbn}_Protein_Peptide_Identification.csv" 
        """
}


process identify_myrimatch {

    tag "MYRIMATCH"
    input:
        set val(mgfbn), file(mgf) from chmyrimatch
    output:
        file 'FDR_Protein_Peptide_Identification.csv' into fdroutsmyrimatch
    script:
        """
       Rscript /home/taoufik/data/ParsingEnginesResults.R  file "${params.indir}/SearchGui/MYRIMATCH/${mgfbn}" engine "myrimatch" 
      cp FDR_Protein_Peptide_Identification.csv "${params.outdir}/MYRIMATCH/${mgfbn}_FDR_Protein_Peptide_Identification.csv" 
      cp Protein_Peptide_Identification.csv "${params.outdir}/MYRIMATCH/${mgfbn}_Protein_Peptide_Identification.csv" 
        """
}
process identify_xtandem {
    
    tag "XTANDEM"
    input:
        set val(mgfbn), file(mgf) from chxtandem
    output:
        file 'FDR_Protein_Peptide_Identification.csv' into fdroutsxtandem
    script:
        """
       Rscript /home/taoufik/data/ParsingEnginesResults.R  file "${params.indir}/SearchGui/XTANDEM/${mgfbn}" engine "xtandem"
      cp FDR_Protein_Peptide_Identification.csv "${params.outdir}/XTANDEM/${mgfbn}_FDR_Protein_Peptide_Identification.csv" 
      cp Protein_Peptide_Identification.csv "${params.outdir}/XTANDEM/${mgfbn}_Protein_Peptide_Identification.csv" 
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

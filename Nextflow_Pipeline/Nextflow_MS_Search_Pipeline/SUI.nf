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
in_mgfdir = file(params.mgfdir)
out_dir_results = file(params.resultsdir)
out_dir_results_searchgui = file("${params.resultsdir}/SearchGui")
out_dir_results_searchgui.mkdirs()
out_dir_results_peptideshaker = file("${params.resultsdir}/PeptideShaker")
out_dir_results_peptideshaker.mkdirs()
println "Listing Peaks Samples"
mgfs = []
in_mgfdir.eachFile { item ->
    if( item.isFile() ) {
        println "${item.getName()} - size: ${item.size()}"
        mgfs << [item.getName(), item]
    }
    else if( item.isDirectory() ) {
        println "${item.getName()} - DIR"
    }
}
dbprot = file("${params.protdbdir}/DB_UniProtKB_Swiss-Prot_Reviewed_No_Isoforms.fasta")
Channel
     .from(mgfs)
     .into{mgfs_ch_omssa;mgfs_ch_comet;mgfs_ch_msgf;mgfs_ch_novor;mgfs_ch_myrimatch;mgfs_ch_xtandem}
process guisearch_mgf_omsa {
    //conda 'peptide-shaker searchgui zip'
    tag "GuiSearch"
    input:
        set val(mgfbn), file(mgf) from mgfs_ch_omssa
    output:
        file 'searchgui_out.zip' into searchguioutsomssa
    script:
        """
       wc -l ${mgf} > searchguipreocesslog.txt;
       echo $mgfbn >> searchguipreocesslog.txt;
       export HOME=$PWD;
       mkdir output;
       mkdir output_reports;
       echo "" > searchgui_stderr &&  echo 'OMSSA';
       echo 'searchgui.version=3.3.10' >> searchgui.properties;
       echo 'Spectrums:${mgfbn}';
       cp ${dbprot} input_database.fasta;
       echo 'Setting paths' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.PathSettingsCLI --exec_dir="bin" -temp_folder $HOME -log searchgui.log  2>> searchgui_stderr &&  echo 'Creating decoy database.' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.FastaCLI --exec_dir="bin" -in input_database.fasta -decoy  2>> searchgui_stderr && rm input_database.fasta && cp input_database_concatenated_target_decoy.fasta input_database.fasta &&  echo 'setting identification parameters' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.IdentificationParametersCLI --exec_dir="bin" -out SEARCHGUI_IdentificationParameters.par   -frag_tol '0.05' -frag_ppm '0' -prec_tol '50.0' -prec_ppm '1'  -min_charge 2 -max_charge 4 -fi b -ri y -min_isotope 0 -max_isotope 1 -enzyme "Trypsin,Glu-C" -mc "2,2"  -fixed_mods "Carbamidomethylation of C" -variable_mods "Oxidation of M,Phosphorylation of S,Phosphorylation of T,Phosphorylation of Y"    -db input_database.fasta -useGeneMapping 0 -updateGeneMapping 0  -xtandem_output_spectra 1             2> searchgui_stderr) &&  echo 'running search gui' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.SearchCLI --exec_dir="bin" -spectrum_files ${mgfbn} -output_folder "output"  -id_params SEARCHGUI_IdentificationParameters.par  -threads 30     -xtandem 0  -myrimatch 0  -msgf 0  -omssa 1  -comet 0  -tide 0  -ms_amanda 0  -andromeda 0  -novor 0  -directag 0  -output_option 0  -output_data 1  2>> searchgui_stderr)  &&  (mv "output/searchgui_out.zip" searchgui_out.zip 2>> searchgui_stderr)  &&  (zip -u searchgui_out.zip searchgui.properties 2>> searchgui_stderr);
  cat searchgui_stderr 2>&1;
  cp searchgui_out.zip  "${params.resultsdir}/SearchGui/OMSSA/${mgfbn}.zip";
        """
}
process guisearch_mgf_comet {
    //conda 'peptide-shaker searchgui zip'
    tag "GuiSearch"
    input:
        set val(mgfbn), file(mgf) from mgfs_ch_comet
    output:
        file 'searchgui_out.zip' into searchguioutscomet
    script:
        """
       wc -l ${mgf} > searchguipreocesslog.txt;
       echo $mgfbn >> searchguipreocesslog.txt;
       export HOME=$PWD;
       mkdir output;
       mkdir output_reports;
       echo "" > searchgui_stderr &&  echo 'COMET';
       echo 'searchgui.version=3.3.10' >> searchgui.properties;
       echo 'Spectrums:${mgfbn}';
       cp ${dbprot} input_database.fasta;
       echo 'Setting paths' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.PathSettingsCLI --exec_dir="bin" -temp_folder $HOME -log searchgui.log  2>> searchgui_stderr &&  echo 'Creating decoy database.' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.FastaCLI --exec_dir="bin" -in input_database.fasta -decoy  2>> searchgui_stderr && rm input_database.fasta && cp input_database_concatenated_target_decoy.fasta input_database.fasta &&  echo 'setting identification parameters' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.IdentificationParametersCLI --exec_dir="bin" -out SEARCHGUI_IdentificationParameters.par   -frag_tol '0.05' -frag_ppm '0' -prec_tol '50.0' -prec_ppm '1'  -min_charge 2 -max_charge 4 -fi b -ri y -min_isotope 0 -max_isotope 1 -enzyme "Trypsin,Glu-C" -mc "2,2"  -fixed_mods "Carbamidomethylation of C" -variable_mods "Oxidation of M,Phosphorylation of S,Phosphorylation of T,Phosphorylation of Y"    -db input_database.fasta -useGeneMapping 0 -updateGeneMapping 0  -xtandem_output_spectra 1             2> searchgui_stderr) &&  echo 'running search gui' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.SearchCLI --exec_dir="bin" -spectrum_files ${mgfbn} -output_folder "output"  -id_params SEARCHGUI_IdentificationParameters.par  -threads 30     -xtandem 0  -myrimatch 0  -msgf 0  -omssa 0  -comet 1  -tide 0  -ms_amanda 0  -andromeda 0  -novor 0  -directag 0  -output_option 0  -output_data 1  2>> searchgui_stderr)  &&  (mv "output/searchgui_out.zip" searchgui_out.zip 2>> searchgui_stderr)  &&  (zip -u searchgui_out.zip searchgui.properties 2>> searchgui_stderr);
  cat searchgui_stderr 2>&1;
  cp searchgui_out.zip  "${params.resultsdir}/SearchGui/COMET/${mgfbn}.zip";
        """
}
process guisearch_mgf_msgf {
    //conda 'peptide-shaker searchgui zip'
    tag "GuiSearch"
    input:
        set val(mgfbn), file(mgf) from mgfs_ch_msgf
    output:
        file 'searchgui_out.zip' into searchguioutsmsgf
    script:
        """
       wc -l ${mgf} > searchguipreocesslog.txt;
       echo $mgfbn >> searchguipreocesslog.txt;
       export HOME=$PWD;
       mkdir output;
       mkdir output_reports;
       echo "" > searchgui_stderr &&  echo 'MSGF';
       echo 'searchgui.version=3.3.10' >> searchgui.properties;
       echo 'Spectrums:${mgfbn}';
       cp ${dbprot} input_database.fasta;
       echo 'Setting paths' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.PathSettingsCLI --exec_dir="bin" -temp_folder $HOME -log searchgui.log  2>> searchgui_stderr &&  echo 'Creating decoy database.' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.FastaCLI --exec_dir="bin" -in input_database.fasta -decoy  2>> searchgui_stderr && rm input_database.fasta && cp input_database_concatenated_target_decoy.fasta input_database.fasta &&  echo 'setting identification parameters' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.IdentificationParametersCLI --exec_dir="bin" -out SEARCHGUI_IdentificationParameters.par   -frag_tol '0.05' -frag_ppm '0' -prec_tol '50.0' -prec_ppm '1'  -min_charge 2 -max_charge 4 -fi b -ri y -min_isotope 0 -max_isotope 1 -enzyme "Trypsin,Glu-C" -mc "2,2"  -fixed_mods "Carbamidomethylation of C" -variable_mods "Oxidation of M,Phosphorylation of S,Phosphorylation of T,Phosphorylation of Y"    -db input_database.fasta -useGeneMapping 0 -updateGeneMapping 0  -xtandem_output_spectra 1             2> searchgui_stderr) &&  echo 'running search gui' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.SearchCLI --exec_dir="bin" -spectrum_files ${mgfbn} -output_folder "output"  -id_params SEARCHGUI_IdentificationParameters.par  -threads 30     -xtandem 0  -myrimatch 0  -msgf 1  -omssa 0  -comet 0  -tide 0  -ms_amanda 0  -andromeda 0  -novor 0  -directag 0  -output_option 0  -output_data 1  2>> searchgui_stderr)  &&  (mv "output/searchgui_out.zip" searchgui_out.zip 2>> searchgui_stderr)  &&  (zip -u searchgui_out.zip searchgui.properties 2>> searchgui_stderr);
  cat searchgui_stderr 2>&1;
  cp searchgui_out.zip  "${params.resultsdir}/SearchGui/MSGF/${mgfbn}.zip";
        """
}

process guisearch_mgf_novor {
    //conda 'peptide-shaker searchgui zip'
    tag "GuiSearch"
    input:
        set val(mgfbn), file(mgf) from mgfs_ch_novor
    output:
        file 'searchgui_out.zip' into searchguioutsnovor
    script:
        """
       wc -l ${mgf} > searchguipreocesslog.txt;
       echo $mgfbn >> searchguipreocesslog.txt;
       export HOME=$PWD;
       mkdir output;
       mkdir output_reports;
       echo "" > searchgui_stderr &&  echo 'NOVOR';
       echo 'searchgui.version=3.3.10' >> searchgui.properties;
       echo 'Spectrums:${mgfbn}';
       cp ${dbprot} input_database.fasta;
       echo 'Setting paths' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.PathSettingsCLI --exec_dir="bin" -temp_folder $HOME -log searchgui.log  2>> searchgui_stderr &&  echo 'Creating decoy database.' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.FastaCLI --exec_dir="bin" -in input_database.fasta -decoy  2>> searchgui_stderr && rm input_database.fasta && cp input_database_concatenated_target_decoy.fasta input_database.fasta &&  echo 'setting identification parameters' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.IdentificationParametersCLI --exec_dir="bin" -out SEARCHGUI_IdentificationParameters.par   -frag_tol '0.05' -frag_ppm '0' -prec_tol '50.0' -prec_ppm '1'  -min_charge 2 -max_charge 4 -fi b -ri y -min_isotope 0 -max_isotope 1 -enzyme "Trypsin,Glu-C" -mc "2,2"  -fixed_mods "Carbamidomethylation of C" -variable_mods "Oxidation of M,Phosphorylation of S,Phosphorylation of T,Phosphorylation of Y"    -db input_database.fasta -useGeneMapping 0 -updateGeneMapping 0  -xtandem_output_spectra 1             2> searchgui_stderr) &&  echo 'running search gui' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.SearchCLI --exec_dir="bin" -spectrum_files ${mgfbn} -output_folder "output"  -id_params SEARCHGUI_IdentificationParameters.par  -threads 30     -xtandem 0  -myrimatch 0  -msgf 0  -omssa 0  -comet 0  -tide 0  -ms_amanda 0  -andromeda 0  -novor 1  -directag 0  -output_option 0  -output_data 1  2>> searchgui_stderr)  &&  (mv "output/searchgui_out.zip" searchgui_out.zip 2>> searchgui_stderr)  &&  (zip -u searchgui_out.zip searchgui.properties 2>> searchgui_stderr);
  cat searchgui_stderr 2>&1;
  cp searchgui_out.zip  "${params.resultsdir}/SearchGui/NOVOR/${mgfbn}.zip";
        """
}
process guisearch_mgf_myrimatch {
    //conda 'peptide-shaker searchgui zip'
    tag "GuiSearch"
    input:
        set val(mgfbn), file(mgf) from mgfs_ch_myrimatch
    output:
        file 'searchgui_out.zip' into searchguioutmyrimatch
    script:
        """
       wc -l ${mgf} > searchguipreocesslog.txt;
       echo $mgfbn >> searchguipreocesslog.txt;
       export HOME=$PWD;
       mkdir output;
       mkdir output_reports;
       echo "" > searchgui_stderr &&  echo 'MYRIMATCH';
       echo 'searchgui.version=3.3.10' >> searchgui.properties;
       echo 'Spectrums:${mgfbn}';
       cp ${dbprot} input_database.fasta;
       echo 'Setting paths' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.PathSettingsCLI --exec_dir="bin" -temp_folder $HOME -log searchgui.log  2>> searchgui_stderr &&  echo 'Creating decoy database.' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.FastaCLI --exec_dir="bin" -in input_database.fasta -decoy  2>> searchgui_stderr && rm input_database.fasta && cp input_database_concatenated_target_decoy.fasta input_database.fasta &&  echo 'setting identification parameters' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.IdentificationParametersCLI --exec_dir="bin" -out SEARCHGUI_IdentificationParameters.par   -frag_tol '0.05' -frag_ppm '0' -prec_tol '50.0' -prec_ppm '1'  -min_charge 2 -max_charge 4 -fi b -ri y -min_isotope 0 -max_isotope 1 -enzyme "Trypsin,Glu-C" -mc "2,2"  -fixed_mods "Carbamidomethylation of C" -variable_mods "Oxidation of M,Phosphorylation of S,Phosphorylation of T,Phosphorylation of Y"    -db input_database.fasta -useGeneMapping 0 -updateGeneMapping 0  -xtandem_output_spectra 1             2> searchgui_stderr) &&  echo 'running search gui' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.SearchCLI --exec_dir="bin" -spectrum_files ${mgfbn} -output_folder "output"  -id_params SEARCHGUI_IdentificationParameters.par  -threads 30     -xtandem 0  -myrimatch 1  -msgf 0  -omssa 0  -comet 0  -tide 0  -ms_amanda 0  -andromeda 0  -novor 0  -directag 0  -output_option 0  -output_data 1  2>> searchgui_stderr)  &&  (mv "output/searchgui_out.zip" searchgui_out.zip 2>> searchgui_stderr)  &&  (zip -u searchgui_out.zip searchgui.properties 2>> searchgui_stderr);
  cat searchgui_stderr 2>&1;
  cp searchgui_out.zip  "${params.resultsdir}/SearchGui/MYRIMATCH/${mgfbn}.zip";
        """
}
process guisearch_mgf_xtandem {
    //conda 'peptide-shaker searchgui zip'
    tag "GuiSearch"
    input:
        set val(mgfbn), file(mgf) from mgfs_ch_xtandem
    output:
        file 'searchgui_out.zip' into searchguioutxtandem
    script:
        """
       wc -l ${mgf} > searchguipreocesslog.txt;
       echo $mgfbn >> searchguipreocesslog.txt;
       export HOME=$PWD;
       mkdir output;
       mkdir output_reports;
       echo "" > searchgui_stderr &&  echo 'XTANDEM';
       echo 'searchgui.version=3.3.10' >> searchgui.properties;
       echo 'Spectrums:${mgfbn}';
       cp ${dbprot} input_database.fasta;
       echo 'Setting paths' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.PathSettingsCLI --exec_dir="bin" -temp_folder $HOME -log searchgui.log  2>> searchgui_stderr &&  echo 'Creating decoy database.' && searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.FastaCLI --exec_dir="bin" -in input_database.fasta -decoy  2>> searchgui_stderr && rm input_database.fasta && cp input_database_concatenated_target_decoy.fasta input_database.fasta &&  echo 'setting identification parameters' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.IdentificationParametersCLI --exec_dir="bin" -out SEARCHGUI_IdentificationParameters.par   -frag_tol '0.05' -frag_ppm '0' -prec_tol '50.0' -prec_ppm '1'  -min_charge 2 -max_charge 4 -fi b -ri y -min_isotope 0 -max_isotope 1 -enzyme "Trypsin,Glu-C" -mc "2,2"  -fixed_mods "Carbamidomethylation of C" -variable_mods "Oxidation of M,Phosphorylation of S,Phosphorylation of T,Phosphorylation of Y"    -db input_database.fasta -useGeneMapping 0 -updateGeneMapping 0  -xtandem_output_spectra 1             2> searchgui_stderr) &&  echo 'running search gui' && (searchgui -Djava.awt.headless=true eu.isas.searchgui.cmd.SearchCLI --exec_dir="bin" -spectrum_files ${mgfbn} -output_folder "output"  -id_params SEARCHGUI_IdentificationParameters.par  -threads 30     -xtandem 1  -myrimatch 0  -msgf 0  -omssa 0  -comet 0  -tide 0  -ms_amanda 0  -andromeda 0  -novor 0  -directag 0  -output_option 0  -output_data 1  2>> searchgui_stderr)  &&  (mv "output/searchgui_out.zip" searchgui_out.zip 2>> searchgui_stderr)  &&  (zip -u searchgui_out.zip searchgui.properties 2>> searchgui_stderr);
  cat searchgui_stderr 2>&1;
  cp searchgui_out.zip  "${params.resultsdir}/SearchGui/XTANDEM/${mgfbn}.zip";
        """
}
workflow.onComplete {
    def subject = 'SUI'
    def recipient = 'bensellak@ensat.ac.ma'

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

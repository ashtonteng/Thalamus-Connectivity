#!/bin/bash

stringCommand="3dttest -base1 0 -prefix t-test -set2 "
for subject in /home/despoB/connectome-thalamus/Thalamus_ROI_connectivity/headbrik_intralaminar/*; do
	stringCommand="${stringCommand}${subject}/stats+orig "
done
$stringCommand

# The CIFTI data Structure in MATLAB

## Introduction

MATLAB is a common tool for neuroimaging analysis due to it performing matrix operations well by design and neuroimaging data naturally conforming to multi-dimensional matrix data structures. This guide aims to give you basic information on how to work with nifti, gifti, and cifti files in MATLAB.

## NIFTI

Reading in standard nifti files, such as those output from converting DICOMS to the BIDS format, can be read in using [FreeSurfer's](https://surfer.nmr.mgh.harvard.edu/) matlab toolbox. This toolbox comes standard with each freesurfer installation and can either be downloaded from their site or can be copied from one of Cheaha's FreeSurfer modules. The toolbox for FreeSurfer version 7.1.1 can be found at `/data/rc/apps/rc/software/FreeSurfer

``` matlab
nif = load_nifti
```

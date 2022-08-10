# Common Neuroimaging Data Structures in MATLAB

## Introduction

MATLAB is a common tool for neuroimaging analysis due to it performing matrix operations well by design and neuroimaging data naturally conforming to multi-dimensional matrix data structures. This guide aims to give you basic information on how to work with nifti, gifti, and cifti files in MATLAB.

All toolboxes mentioned here can be loaded by running the following command:

``` matlab
addpath(genpath('</path/to/toolbox>'))
```

## NIFTI

Reading in standard nifti files, such as those output from converting DICOMS to the BIDS format, can be read in using [FreeSurfer's](https://surfer.nmr.mgh.harvard.edu/) matlab toolbox. This toolbox comes standard with each FreeSurfer installation and can either be downloaded from their site or can be copied from one of Cheaha's FreeSurfer modules. The toolbox for FreeSurfer version 7.1.1 can be found at `/share/apps/rc/software/FreeSurfer/7.1.1-centos7_x86_64/matlab`. It's advised to make a copy of this toolbox in your personal space as opposed to adding the module to your path.

``` matlab
nif = load_nifti('<path>')
```

`nif` will be a struct where the `vol` field will contain either a 3D or 4D matrix, depending on if the data are cross-sectional or a time series. Each element within the matrix represents a voxel.

<!-- markdownlint-disable MD046 -->
!!! note

    This `matlab` folder also contains functions for reading and writing FreeSurfer's mgz, label, annot, etc. file formats into MATLAB as well. Look through the toolbox to see the options available to you for working with FreeSurfer in MATLAB
<!-- markdownlint-enable MD046 -->

## GIFTI

Reading GIFTI files into MATLAB can be done with the [gifti toolbox](https://github.com/gllmflndn/gifti). Either clone the repo into your space with `git clone` or download the repo using the green Code dropdown on the repo site.

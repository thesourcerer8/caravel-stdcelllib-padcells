#!/bin/bash
export OPENLANE_IMAGE_NAME=openlane:rc5
export OPENLANE_ROOT=/media/philipp/Daten/skywater/openlane/
export PDK_ROOT=/media/philipp/Daten/skywater/open_pdks/sky130
make user_proj_example
make user_project_wrapper
cd ..
make

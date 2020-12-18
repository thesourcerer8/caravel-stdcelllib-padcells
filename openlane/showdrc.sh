#!/bin/bash
cd user_proj_example/runs/user_proj_example/results/magic
ln -s ../../../../../../cells/mag/*.mag .
magic user_proj_example.drc.mag

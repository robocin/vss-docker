#!/usr/bin/python3
import getpass
import os

pwd = getpass.getpass("Enter your token: ")
os.system("rm -rf vss-unification rl-larc2021")
os.system(f"git clone --recursive https://{pwd}:x-oauth-basic@github.com/robocin/rl-larc2021.git -b run_divA")
os.system("mv rl-larc2021 vss-unification")
#!/bin/sh

collection_path="$(ansible-galaxy collection build --force ./w3f/substrate-benchmarks |  awk '{print $6}')"
ansible-galaxy collection publish ${collection_path}

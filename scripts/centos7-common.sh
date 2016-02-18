#!/bin/bash

# System update
yum -y update --exclude=kernel

# Tools
yum install -y git unzip nc telnet


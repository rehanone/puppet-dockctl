# rehan-dockctl

[![Build Status](https://travis-ci.com/rehanone/puppet-dockctl.svg?branch=master)](https://travis-ci.com/rehanone/puppet-dockctl)

#### Table of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
    * [Classes](#classes)
    * [Referances](#referances)
5. [Dependencies](#dependencies)
6. [Development](#development)

## Overview
The `rehan-dockctl` installs & manages `dockctl` a tool to control/manage various aspects of docker/docker-compose projects on a single host.

## Module Description
A puppet module for managing the installation of `dockctl`.

More information on `dockctl` tool can be found at:

  - [https://github.com/rehanone/dockctl](https://github.com/rehanone/dockctl)

## Setup
In order to install `rehan-dockctl`, run the following command:
```bash
$ puppet module install rehan-dockctl
```
The module does expect all the data to be provided through 'Hiera'. See [Usage](#usage) for examples on how to configure it.

#### Requirements
This module is designed to be as clean and compliant with latest puppet code guidelines.

## Usage

### Classes

#### `dockctl`

A basic install with the defaults would be:
```puppet
include dockctl
```

## Dependencies

* [stdlib][1]
* [vcsrepo][2]

[1]:https://forge.puppet.com/puppetlabs/stdlib
[2]:https://forge.puppet.com/puppetlabs/vcsrepo

## Development

You can submit pull requests and create issues through the official page of this module: https://github.com/rehan/puppet-dockctl.
Please do report any bug and suggest new features/improvements.

# Simulate

A user-friendly web-based interface for managing simulations on HPC and cloud resources.

This repository is for managing project-level issues. See separate repositories below for code and component-level issues.

- [frontend](https://github.com/alan-turing-institute/gateway-frontend): A front-end web application.
- [middleware](https://github.com/alan-turing-institute/gateway-middleware): A middleware service between the front-end and multiple job managers.
- [auth](https://github.com/alan-turing-institute/gateway-auth): An authorisation service.
- [manager](https://github.com/alan-turing-institute/gateway-job-manager-openfoam): A service for deploying backend simulator resources.
- [simulator](https://github.com/alan-turing-institute/gateway-simulator-openfoam): A backend simulator for OpenFOAM.

### Installation

Refer to http://simulate.readthedocs.io.

### Contributors

This repository also manages project-level issues: see the [issues](https://github.com/alan-turing-institute/simulate/issues) page for current development status.

To update to latest state:

```
git submodule update --recursive
```

# Gateway

A user-friendly web-based interface for managing simulations on HPC and cloud resources.

This repository is for managing project-level issues. See separate repositories below for code and component-level issues.

- [gateway-frontend](https://github.com/alan-turing-institute/gateway-frontend): A frontend web application.
- [gateway-middleware](https://github.com/alan-turing-institute/gateway-middleware): A middleware service between the frontend and multiple job managers.
- [gateway-job-manager-openfoam](https://github.com/alan-turing-institute/gateway-job-manager-openfoam): A service for deploying backend simulator resources.
- [gateway-simulator-openfoam](https://github.com/alan-turing-institute/gateway-simulator-openfoam): A backend simulator for OpenFOAM.

### Installation

1. Ensure that you have installed [Docker](https://docs.docker.com/docker-for-mac/install/).

1. Start the Docker daemon if it is not already running.

1. Clone this repository:

    ```bash
    git clone --recursive https://github.com/alan-turing-institute/gateway
    cd gateway
    ```

1. If this is the first time you are running the system:

    a. Run the Postgres server individually in order for it to set itself up:

    ```
    docker-compose run postgres
    ```
    b. Shutdown the Postgres server:

    ```
    docker-compose down
    ```

1. Create job manager ssh keys:
    ```shell
    (cd gateway-job-manager-openfoam/keys && ./create_keys.sh)
    ```

1. Bring up the full system.
    ```bash
    docker-compose up
    ```

### Connecting to the simulator

```bash
ssh -o IdentitiesOnly=yes \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -i gateway-job-manager-openfoam/keys/simulator_key \
    -p 10022 \
    testuser@localhost
```

### Contributors

This repository also manages project-level issues: see the [issues](https://github.com/alan-turing-institute/gateway/issues) page for current development status.

To update to latest state:

```
git submodule update --recursive
```


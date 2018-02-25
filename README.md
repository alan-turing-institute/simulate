# Science Gateway

A user-friendly web-based interface for managing simulations on HPC and cloud resources.

This repository is for managing project-level issues. See separate repositories below for code and component-level issues.

- [science-gateway-inputs](https://github.com/alan-turing-institute/science-gateway-inputs): A frontend web application.
- [science-gateway-data-model](https://github.com/alan-turing-institute/science-gateway-data-model): A middleware service between the frontend and multiple job managers.
- [science-gateway-job-manager-blue](https://github.com/alan-turing-institute/science-gateway-job-manager-blue): A service for deploying backend simulator resources.
- [science-gateway-simulator-openfoam](https://github.com/alan-turing-institute/science-gateway-simulator-openfoam): A backend simulator for OpenFOAM.

### Installation

1. Ensure that you have installed [Docker](https://docs.docker.com/docker-for-mac/install/).

1. Start the Docker daemon if it is not already running.

1. Clone this repository:

    ```bash
    git clone --recursive https://github.com/alan-turing-institute/science-gateway
    cd science-gateway
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
    (cd science-gateway-job-manager-blue && ./create_keys.sh)
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
    -i science-gateway-job-manager-blue/keys/simulator_key \
    -p 10022 \
    testuser@localhost
```

### Contributors

This repository also manages project-level issues: see the [issues](https://github.com/alan-turing-institute/science-gateway/issues) page for current development status.

To update to latest state:

```
git submodule update --recursive
```


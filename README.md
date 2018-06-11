# Gateway

A user-friendly web-based interface for managing simulations on HPC and cloud resources.

This repository is for managing project-level issues. See separate repositories below for code and component-level issues.

- [gateway-frontend](https://github.com/alan-turing-institute/gateway-frontend): A frontend web application.
- [gateway-middleware](https://github.com/alan-turing-institute/gateway-middleware): A middleware service between the frontend and multiple job managers.
- [gateway-auth](https://github.com/alan-turing-institute/gateway-auth): An authorisation service.
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

    ```shell
    docker-compose run postgres
    ```
    b. Shutdown the Postgres server:

    ```shell
    docker-compose down
    ```

1. Create job manager ssh keys:
    ```shell
    (cd gateway-job-manager-openfoam/keys && ./create_keys.sh)
    ```

1.    Configure application components:

    ```shell
    (cd gateway-openfoam/gateway-job-manager-openfoam && cp config.py.example config.py)
    (cd gateway-auth && cp config.py.example config.py)
    ```

1. Bring up the full system.
    ```bash
    docker-compose build  # optional
    docker-compose up
    ```

### Connecting to containers

Note, you can always use `docker exec` based methods to connect to containers. We do however need to mock an ssh connection.

Connect from your computer (main host) to the simulator via ssh:

```
ssh -o StrictHostKeyChecking=no -i gateway-job-manager-openfoam/keys/simulator_key testuser@0.0.0.0 -p 10022
```

Connect from the job manager to the simulator via ssh:

```bash
cd /app
ssh -i keys/simulator_key testuser@gateway_simulator_1
```

### Contributors

This repository also manages project-level issues: see the [issues](https://github.com/alan-turing-institute/gateway/issues) page for current development status.

To update to latest state:

```
git submodule update --recursive
```

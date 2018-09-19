.. _quickstart:

Quickstart Guide
================

The Simulate system can be started using `Docker Compose <https://docs.docker.com/compose/>`_.

Development mode
----------------

#. Ensure that you have installed `Docker <https://www.docker.com/community-edition#/download>`_ and start the Docker daemon (if it is not already running).

#. Clone the main Simulate GitHub repository: [#]_

    .. code-block:: shell

        git clone --recursive https://github.com/alan-turing-institute/simulate.git
        cd simulate

#. Create the *frontend* configuration file:

    .. code-block:: shell

        cp frontend/src/environments/environment.example.ts frontend/src/environments/environment.prod.ts


#. Create the *auth* configuration file:

    .. code-block:: shell

        cp auth/config.example.json auth/config.development.json

#. Create the *middleware* configuration file:

    .. code-block:: shell

        cp middleware/config.example.json middleware/config.development.json

#. Create the *manager* SSH keys and configuration file:

    .. code-block:: shell

        cp openfoam/manager/config.example.json openfoam/manager/config.development.json
        cd openfoam/manager/keys && ./create_keys.sh && cd -

#. Add the *storage* configuration using environment variables: [#]_

    .. code-block:: shell

        export STORAGE_ACCOUNT_NAME=simulate
        export STORAGE_ACCOUNT_KEY=<key>
    
#. Bring the set of microservices up: [#]_

    .. code-block:: shell

        docker-compose up --build

#. Create a test user [#]_ on *auth*:

    .. code-block:: shell

        curl -X POST localhost:5000/test

#. Create test case data on the *middleware*:

    .. code-block:: shell

        curl -X POST localhost:5050/test

The *frontend* will now be available at ``http://localhost:8080``. You can now navigate to this URL in a web browser.


Production mode
---------------

#. Follow the above, but use production configurations:

    .. code-block:: shell

        cp nginx/project.example.conf nginx/project.conf
        cp auth/config.example.json auth/config.production.json
        cp middleware/config.example.json middleware/config.production.json
        cp openfoam/manager/config.example.json openfoam/manager/config.production.json
        cd openfoam/manager/keys && ./create_keys.sh && cd -
        docker-compose --file docker-compose.production.json up --build

#. Generate SSL certificates via `letsencrypt <https://certbot.eff.org/>`_:

    .. code-block:: shell

        sudo certbot certonly --standalone -d simulate.uksouth.cloudapp.azure.com

The *frontend* will now be available ``http://localhost:80``.



.. [#] Simulate uses Git submodules, hence the ``--recursive`` option must be included in the ``clone`` command.
.. [#] Currently, we support MS Azure Storage Accounts. Hence, ``<key>`` is a secret key string obtainable through Storage Account "Access Keys" at `<portal.azure.com>`_.
.. [#] Docker images can take several minutes to build if this is the first time you are building them.
.. [#] The test user has the credentials username: ``turing``, password: ``turing``
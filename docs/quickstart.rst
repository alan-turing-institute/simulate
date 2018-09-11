.. _quickstart:

Quickstart Guide
================

The Simulate system can be started using `Docker Compose <https://docs.docker.com/compose/>`_.

Setting up Simulate
-------------------

#. Ensure that you have installed `Docker <https://www.docker.com/community-edition#/download>`_ and start the Docker daemon (if it is not already running).

#. Clone the main Simulate GitHub repository: [#]_

    .. code-block:: shell

        git clone --recursive https://github.com/alan-turing-institute/simulate.git
        cd simulate

#. Create the *auth* configuration file:

    .. code-block:: shell

        cd auth
        cp config.example.json config.development.json
        cd ..

#. Create the *middleware* configuration file:

    .. code-block:: shell

        cd middleware
        cp config.example.json config.development.json
        cd ..

#. Create the *manager* SSH keys and configuration file:

    .. code-block:: shell

        cd openfoam/manager
        cp config.example.json config.development.json
        cd keys
        ./create_keys.sh
        cd ../../..

#. Add the *storage* configuration using environment variables: [#]_

    .. code-block:: shell

        export STORAGE_ACCOUNT_NAME=simulate
        export STORAGE_ACCOUNT_KEY=<key>
    
#. Bring the set of microservices up: [#]_

    .. code-block:: shell

        docker-compose build
        docker-compose up -d

#. Create a test user [#]_ on *auth*:

    .. code-block:: shell

        curl -X POST localhost:5000/test

#. Create test case data on the *middleware*:

    .. code-block:: shell

        curl -X POST localhost:5050/test

Accessing Simulate
------------------

The *front end* will now be available at ``http://localhost:8080``. You can now navigate to this URL in a web browser.

.. [#] Simulate uses Git submodules, hence the ``--recursive`` option must be included in the ``clone`` command.
.. [#] Currently, we support MS Azure Storage Accounts. Hence, ``<key>`` is a secret key string obtainable through Storage Account "Access Keys" at `<portal.azure.com>`_.
.. [#] Docker images can take several minutes to build if this is the first time you are building them.
.. [#] The test user has the credentials username: ``turing``, password: ``turing``





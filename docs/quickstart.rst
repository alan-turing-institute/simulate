.. _quickstart:

Quickstart Guide
================

The Simulate system can be started using `Docker Compose <https://docs.docker.com/compose/>`_.

Setting up Simulate
-------------------

#. Ensure that you have installed `Docker <https://www.docker.com/community-edition#/download>`_ and start the Docker daemon (if it is not already running).

#. Clone the main Simulate GitHub repository: [#]_

    .. code-block:: shell

        git clone --recursive git@github.com:alan-turing-institute/simulate.git
        cd simulate

#. Create the *authoriser* configuration file:

    .. code-block:: shell

        cd gateway-auth
        cp config.example.json config.development.json
        cd ..

#. Create the *job manager* SSH keys and configuration file:

    .. code-block:: shell

        cd gateway-OpenFOAM/gateway-job-manager-OpenFOAM
        cp config.example.json config.development.json
        cd keys
        ./create_keys.sh
        cd ../../..

#. Bring the set of microservices up: [#]_

    .. code-block:: shell

        docker-compose up

#. Create a test user [#]_ on the *authoriser*:

    .. code-block:: shell

        curl -X POST localhost:5000/test

#. Create test case data on the *middleware*:

    .. code-block:: shell

        curl -X POST localhost:5050/test

Accessing Simulate
------------------

The *frontend* will now be available at ``http://localhost:8080``. You can now navigate to this URL in a web browser.


.. [#] ``docker-compose`` will build each docker image. This process can take several minutes.
.. [#] Simulate uses Git submodules, hence the ``--recursive`` option must be included in the ``clone`` command.
.. [#] The test user has the credentials username: ``turing``, password: ``turing``

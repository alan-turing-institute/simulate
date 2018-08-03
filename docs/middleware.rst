Middleware
===========

The *middleware* acts as the bridge between the multi-purpose section
of the SiMulate system and user defined execution environments.
It is responsible for managing jobs and cases, as well as all communication
with the *job manager* through a well defined API.

It stores the definitions of different cases as well as all currently
selected sets of parameter values. As part of this, it is the only service
that the front end communicates with to manage jobs. This does mean that
there are queries that are sent to the middleware that it does no processing
for, and passes directly to the *job manager*. This aspect of the design
is intensional and serves to insulate the front end from any need to be
aware of user defined components.

The *middleware* communicates with every component in the defined SiMulate
system:

Front-end
    The *middleware* is the source of all job and case information for the
    *front end*. It has end points to manage cases and jobs, and all job
    and case management is mediated through the *middleware*. The
    *middleware* does not manage user authentication.

Authenticator:
    Many requests supported by the *middleware* require the user to be
    authenticated. The *middleware* uses the *authenticator*  to validate
    tokens that are passed with requests.

Job Manager:
    The *job manager* is responsible for actually running jobs once they
    have been configured, and for notifying the *middleware* of changes
    to their status. Thus, the *middleware* will send specifications for
    fully configured jobs to the *job manager*, which will then run them.
    It will also update the *middleware* whenever there are changes to
    the job state. The *job manager* must actively push updates the
    *middleware*, as it will not query for changes.


Requirements
--------------

The *middleware* can be run standalone as long as:

#. It has a PostgreSQL instance to store data in
#. You do not try to do anything
#. You can do most tasks with an *authenticator*
#. For everything else you need a *job manager*

Starting
---------

Set up
********

In order to run the *middleware* your system settings must be
correctly configured in ``config.<mode>.json``.
The mode is set through the ``FLASK_CONFIGURATION`` environmental
variable, defaulting to ``development``.

An example configuration is:

.. code-block:: json

    {
        "SQLALCHEMY_DATABASE_URI": "postgres://sg:sg@postgres/sg",
        "JOB_MANAGER_URL": "http://job-manager:5001/job",
        "AUTHENTICATION_URL": "http://auth:5050/auth/status",
        "AUTHENTICATE_ROUTES": true
    }

Docker
********

The *middleware* can be run through docker with the following command::

    docker-compose up

Locally
*********

In order to run the *middleware* locally you must have:

* PostgreSQL
* Python 3.6+

You must then run the following commands:

.. code-block:: bash

    pip install -r requirements.txt
    FLASK_CONFIGURATION=development python app.py

Note that if you need to run the system in production mode you
will need to make the appropriate changes as described in the
Flask documentation.

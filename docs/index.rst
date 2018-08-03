.. Simulate documentation master file, created by
   sphinx-quickstart on Tue Jun 26 16:40:45 2018.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

.. toctree::
   :maxdepth: 2
   :caption: Contents:

SiMulate
=========

`SiMulate <https://github.com/alan-turing-institute/simulate>`_ is a  web  application,  to  run  simulations  either  in the  cloud  or on  other computing  infrastructure.

Background
----------
Simulations are useful in a huge number of disciplines, from medical research to insurance to astronomy. Setting up such simulations and visualising their results can be extremely complex and require considerable computing power.

Often users wanting to run simulations are experts in their particular industrial or scientific fields, but not experts in the complex simulation software or the computing platforms required to run them effectively. As a result the real-world use of such software in industry is low.

To tackle this problem, software engineers at The Alan Turing Institute, in collaboration with partners at Imperial College and UCL, have developed SiMulate which aims to make the simulation process more user-friendly, and link seamlessly with cloud-based supercomputing. The tool has the potential to make running, visualising, sharing, and reproducing simulations simpler, for both academic and industrial communities.


.. _simulate_components:
SiMulate Components
-------------------
SiMulate consists of several components, which interact to provide different set of functionalities required for different scenarios.

Three components are common to all SiMulate code bases.

`Frontend <https://github.com/alan-turing-institute/gateway-frontend>`_ enables a user interacts with the system by starting simulation jobs and and visualizing outputs. `Middleware <https://github.com/alan-turing-institute/gateway-middleware>`_ facilitates communication between different components through REST API. `Authentication <https://github.com/alan-turing-institute/gateway-auth>`_ provides access tokens that the middleware checks against, in order to enable content management.

- `Frontend <https://github.com/alan-turing-institute/gateway-frontend>`_
- `Middleware <https://github.com/alan-turing-institute/gateway-middleware>`_
- `Authentication <https://github.com/alan-turing-institute/gateway-auth>`_ 

Additional components provide other functionalities such as access to Azure cloud storage or simulation engines.

.. _getting-to-simulate:
Getting to SiMulate
-------------------
Something about docker-compose here
Link to OpenFoam for example

=================================


* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

Gateway
=======

Simulate uses `nginx <https://www.nginx.com/>`_ as an API gateway. This way requests to a single domain can be routed to the appropriate micro-service. An example configuration is set in ``nginx/project.conf``.

::

        server {
            listen 80;
            server_name frontend;
            location / {
                proxy_pass http://frontend:80;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            }
        }

        server {
            listen 5000;
            server_name middleware;
            location / {
                proxy_pass http://middleware:5000;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            }
        }

        server {
            listen 5010;
            server_name manager;
            location / {
                proxy_pass http://manager:5010;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            }
        }


For example, with the above configuration it is possible to access the *frontend* and *middleware* directly from the host.

.. mermaid::

    sequenceDiagram
        participant C as Client
        participant G as API Gateway
        participant F as Frontend
        participant M as Middleware
        C ->> G: GET host:80
        G ->> F: GET frontend:80
        F ->> C: content
        C ->> G: GET host:5000/job
        G ->> M: GET middleware:5000/job
        M ->> C: content

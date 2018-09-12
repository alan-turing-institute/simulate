Chart
-----

.. mermaid::

    sequenceDiagram
        participant Martin as User
        participant May as Frontend
        participant Roma as Middleware
        participant Nick as Manager
        participant Lachlan as Simulator
        Martin->>May: Show all cases
        May->>Roma: GET /case?page=1&per_page=5
        Roma->>May: [{case header...},...]
        Martin->>May: Show the smoothie case
        May->>Roma: GET /case/2
        Roma->>May: {case details...}
        Martin->>May: Make this a job called "Test 1"
        May->>Roma: POST /job {case_id, job_title, user}
        Roma->>May: {job_id}
        Martin->>May: Set these values
        May->>Roma: PATCH /job/job_id {fields: [...]}
        Roma->>May: {success}
        Martin->>May: Run this job
        May->>Roma: POST /job/job_id
        Roma->>Nick: POST /job_id/start {fields, scripts}
        Nick->>Lachlan: SSH job_id, patched scripts (check return codes)
        Lachlan->>Lachlan: Runs / queues the job
        Nick->>Roma: PATCH /job/id/status {queued}
        Roma->>May: {success} (This might not be implemented or used)
        Martin->>Martin: Goes home
        Lachlan->>Nick: PATCH /job/id/status {Running}
        Nick->>Roma: PATCH /job/id/status {Running}
        Martin->>May: Show all jobs
        May->>Roma: GET /job 
        Roma->>May: [{job heading inc. status}]
        May->>Roma: GET /job/id/status (optional polling for status)
        Roma->>May: {status}
        Martin->>May: Show me job 2
        May->>Roma: GET /job/id
        Roma->>May: {full job details}
        May->>Roma: GET /job/id/status (optional polling)
        Roma->>May: {status}
        Martin->>Martin: Lunch
        Lachlan->>Nick: PATCH /job/id/status {clean up}
        Nick->>Lachlan: {Azure token}
        Nick->>Roma: PATCH /job/id/status {clean up}
        Lachlan->>Lachlan: Copies outputs to Azure
        Lachlan->>Nick: PATCH /job/id/status {done, [output: uri]}
        Nick->>Roma: PATCH /job/id/status {done, [output: uri]}
        Martin->>May: Show me that status again
        May->>Roma: GET /job/id
        Roma->>May: {job details}
        Martin->>May: What outputs are there?
        May->>Roma: GET /job/id/output
        Roma->>May: [output: uri]
        Martin->>May: Download csv1
        May->>Roma: GET /job/id/output/output_id
        Roma->>Nick: GET /job/id/output {URI}
        Nick->>Nick: Generate access token
        Nick->>Roma: {access token}
        Roma->>May: {access token}
        May->>May: Fetch URI with access token
        Martin->>Martin: Open Excel
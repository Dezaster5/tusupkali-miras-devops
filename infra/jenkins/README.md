# Local Jenkins for the laboratory

The image includes Python, Git, Docker CLI, Pipeline, Git, JCasC, Job DSL and Stage View.
Start it from the repository root: `docker compose -f infra/jenkins/compose.yml up -d --build`.
Open http://localhost:8080/ and sign in as `miras`.
The local password is stored in `infra/jenkins/.secrets/admin_password` (ignored by Git).
The password file must be created locally; it is never committed or included in the source ZIP.
Job `Tusupkali_Miras_DevOps` is configured automatically from GitHub by JCasC + Job DSL.
The public repository is checked out over HTTPS without GitHub credentials.

This is a local trusted-student lab: the Docker socket lets Jenkins control Docker.
The web port is bound only to 127.0.0.1; authentication stays enabled.
Do not reuse this controller for untrusted repositories or expose it to the Internet.
Stop without deleting stored jobs: `docker compose -f infra/jenkins/compose.yml down`.

# DevOps Student Application

Tusupkali Miras · IT2-2312 · Student ID 38366

Python HTTP application with four integration tests, Docker and a Jenkins pipeline.
The application uses the Python standard library; no pip packages are required.

Routes: `/` — student information, `/api/student` — JSON, `/health` — health check.

```bash
python -m unittest discover -s tests -v
python -m app.main
docker compose up -d --build
docker compose -f infra/jenkins/compose.yml up -d
```

Application: http://localhost:8000/ · Jenkins: http://localhost:8080/
Pipeline: Checkout → Build → Test → Docker Build → Docker Run.
The local Jenkins password is provided through an ignored Docker secret file.

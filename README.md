# Tusupkali Miras - DevOps laboratory

Student: Miras Tusupkali | Group: IT2-2312 | Student ID: 38366

Individual workflow: Linux -> Git -> GitHub -> Jenkins -> Build -> Test -> Docker -> application.
GitHub: https://github.com/Dezaster5/tusupkali-miras-devops

## Run on Linux / Ubuntu

```bash
bash scripts/setup_linux.sh
./scripts/Tusupkali_Miras_system.sh
python3 -m unittest discover -s tests -v
python3 -m app.main
```

The application listens on port 8000. `/` shows personal information; `/api/student` returns JSON.
`/health` returns HTTP 200 and a JSON readiness status for Docker and Jenkins checks.

## Docker

If a previous Jenkins run created `tusupkali-miras-container`, stop and remove that lab
container before the Compose demonstration; Compose needs to create its own container.

```bash
docker build -t tusupkali-miras-devops .
docker compose up -d
curl http://localhost:8000/
docker logs tusupkali-miras-container
docker compose down
```

Copy `config/student.env.example` to `.env` to override the four student environment variables.
No application dependencies need installation: only the Python standard library is used.
The application runs as a non-root user in its container.

## Jenkins

See `infra/jenkins/README.md`. Open http://localhost:8080/.
Job: `Tusupkali_Miras_DevOps`.
Stages: Checkout, Build, Test, Docker Build, Docker Run.
Stop the Compose application before a Pipeline run: both use the same named lab container.

## Demonstration and submission

See `docs/COMMANDS_RU.md`, `docs/VIDEO_SCRIPT_RU.md`, and `docs/REPORT.md`.
The video must contain the student's own screen recording and voice.
Private local credentials, ignored logs and backup files are not source deliverables.

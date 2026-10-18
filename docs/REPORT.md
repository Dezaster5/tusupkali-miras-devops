# DevOps Fundamentals: Linux, Git, Docker and Jenkins

Student: Miras Tusupkali
Group: IT2-2312
Student ID: 38366
GitHub: https://github.com/Dezaster5/tusupkali-miras-devops

## Linux
The personalized project contains app, scripts, config, logs and backup directories.
The system script displays student/system information and checks the information file.
The log demonstration includes find, grep, error counting and the last five lines.
private.txt uses 600; public.txt uses 644. Process commands demonstrate PID, CPU and memory.

## Git and GitHub
The project uses meaningful commits, an ignored log/backup/.env, a development branch and merge.
The remote repository belongs to Dezaster5. Git history is the evidence of actual changes.

## Docker
The Dockerfile uses FROM, WORKDIR, COPY, RUN, EXPOSE and CMD.
The application exposes the student's information and accepts four environment variables.
Compose defines the image, container, local port and environment. The container runs as a non-root user.

## Jenkins
The Jenkinsfile defines Checkout, Build, Test, Docker Build and Docker Run.
The local controller is configured through JCasC and Job DSL, with authentication enabled.
The public GitHub repository is checked out over HTTPS. Local secrets are ignored by Git.

## Integrated workflow
Linux provides the execution environment; Git records changes; GitHub stores the repository.
Jenkins checks out a commit, compiles and tests the application, builds an image and starts a container.
If a stage fails, later ordinary stages are skipped. A build is successful only when Jenkins reports SUCCESS.

## Evidence and conclusion
Use the accompanying PDF and actual logs/screenshots for verified execution results.
The student must record the continuous demonstration personally and understand each command.

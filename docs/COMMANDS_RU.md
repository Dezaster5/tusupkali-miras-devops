# Команды для защиты

Работай в Ubuntu, в папке `~/devops/tusupkali_miras`.
Копия на Windows: `C:\Users\Мирас\Desktop\Мирас\Labs_4_course\DevOps\tusupkali_miras`.

## Linux

```bash
pwd
ls -la
bash scripts/linux_demo.sh
./scripts/Tusupkali_Miras_system.sh
ls -l private.txt public.txt
find . -name application.log
grep ERROR logs/application.log
grep WARNING logs/application.log
grep -c ERROR logs/application.log
tail -n 5 logs/application.log
ps aux
top
```

`pwd` - текущая папка; `cd` - перейти; `mkdir` - создать папку; `touch` - создать файл.
`cp` - копировать; `mv` - переместить/переименовать; `rm` - удалить указанный файл.
`cat`, `head`, `tail` - весь текст, начало и конец файла.
`find` ищет имена файлов, `grep` ищет текст внутри файлов.
`chmod 600`: владелец читает и пишет, остальные не имеют доступа.
`chmod 644`: владелец читает/пишет, группа и остальные только читают.
`r/w/x`: чтение/запись/выполнение. `chmod 755`: rwx/r-x/r-x.
Процесс - запущенная программа; PID - её номер. `ps` даёт снимок, `top` обновляет данные.

## Git

```bash
git status
git log --oneline --graph --all
git branch -a
git check-ignore logs/application.log backup/ignored-example.txt .env
git remote -v
```

Коммиты отражают реальные изменения. Ветка development содержит улучшение приложения.
`git push` отправляет коммиты, `git pull` получает изменения и интегрирует их локально.
`.gitignore` исключает логи, резервные копии и локальные секреты.

## Docker

После Pipeline контейнер уже работает. Перед демонстрацией Compose останови и удали
этот учебный контейнер (приложение не хранит пользовательские данные):

```bash
docker stop tusupkali-miras-container
docker rm tusupkali-miras-container
```

```bash
docker build -t tusupkali-miras-devops .
docker images
docker compose up -d
docker ps
docker ps -a
docker logs tusupkali-miras-container
docker exec tusupkali-miras-container python --version
docker stop tusupkali-miras-container
docker start tusupkali-miras-container
docker compose down
```

Когда закончишь Docker-демонстрацию, запусти Jenkins Job заново: Pipeline снова создаст контейнер.

Для демонстрации ручного запуска с переменными сначала останови Compose:

```bash
docker run -d --name tusupkali-miras-container \
  --label devops.student-id=38366 -p 127.0.0.1:8000:8000 \
  -e STUDENT_NAME=Miras -e STUDENT_SURNAME=Tusupkali \
  -e STUDENT_GROUP=IT2-2312 -e STUDENT_ID=38366 tusupkali-miras-devops
docker logs tusupkali-miras-container
docker stop tusupkali-miras-container
docker rm tusupkali-miras-container
```

Образ - шаблон файловой системы и запуска; контейнер - созданный экземпляр образа.
FROM задаёт базовый образ; WORKDIR - рабочую папку; COPY - копирование;
RUN выполняется при сборке; EXPOSE описывает порт; CMD задаёт запуск.
Переменные окружения меняют конфигурацию без пересборки. Пароли нельзя вшивать в образ.

## Jenkins

Открой http://localhost:8080/ -> Tusupkali_Miras_DevOps -> Build Now -> Console Output.
Покажи все пять этапов, данные студента, фактический Git commit и `Finished: SUCCESS`.
Если этап падает, следующие обычные этапы не запускаются; Pipeline получает FAILURE.
GitHub хранит код; Jenkins получает конкретный коммит, проверяет его и собирает образ.

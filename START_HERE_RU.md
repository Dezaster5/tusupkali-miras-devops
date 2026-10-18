# Как открыть и показать проект

Студент: Miras Tusupkali, IT2-2312, Student ID 38366.

## Где проект

- Папка Windows: `DevOps/tusupkali_miras`.
- Рабочая Linux-копия: `~/devops/tusupkali_miras` в Ubuntu.
- GitHub: https://github.com/Dezaster5/tusupkali-miras-devops
- Приложение после запуска: http://localhost:8000/
- Jenkins после запуска: http://localhost:8080/

## Что такое Jenkins

Это сервис автоматизации. Он получает код из GitHub, проверяет приложение,
собирает Docker-образ и запускает контейнер. Все пять этапов описаны в Jenkinsfile.
Job называется `Tusupkali_Miras_DevOps`.

## Запуск

На этом компьютере Docker Engine установлен в Ubuntu. Docker Desktop для проекта не требуется.
Открой Ubuntu:

```bash
cd ~/devops/tusupkali_miras
sudo systemctl start docker
docker compose -f infra/jenkins/compose.yml up -d
```

Открой http://localhost:8080/. Логин: `miras`.
Пароль находится в локальном файле `infra/jenkins/.secrets/admin_password`
в папке проекта (копия есть и в папке Windows).
Он не загружается в GitHub и не входит в архив исходников.
Открой Job -> Build Now -> Console Output.
Убедись, что результат - `Finished: SUCCESS`, затем открой http://localhost:8000/.

## Linux-часть

Открой Ubuntu и выполни:

```bash
cd ~/devops/tusupkali_miras
bash scripts/linux_demo.sh
python3 -m unittest discover -s tests -v
git log --oneline --graph --all
```

## Что сдавать

1. Ссылка на публичный GitHub-репозиторий.
2. PDF-отчёт с фактическими результатами и скриншотами.
3. Непрерывное видео со своим голосом, ориентировочно 10-20 минут.
   Порядок показа: `docs/VIDEO_SCRIPT_RU.md`.

Сначала проверь команды и объяснения из `docs/COMMANDS_RU.md`.
Не записывай пароли и приватный SSH-ключ в видео.

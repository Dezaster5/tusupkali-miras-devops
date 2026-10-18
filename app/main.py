"""Small standard-library application for the individual DevOps laboratory."""
import json
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer


def student_information():
    return {
        "name": os.getenv("STUDENT_NAME", "Miras"),
        "surname": os.getenv("STUDENT_SURNAME", "Tusupkali"),
        "group": os.getenv("STUDENT_GROUP", "IT2-2312"),
        "student_id": os.getenv("STUDENT_ID", "38366"),
    }


def welcome_message():
    student = student_information()
    return (
        "================================\n"
        "DevOps Student Application\n"
        "================================\n\n"
        f"Name: {student['name']}\n"
        f"Surname: {student['surname']}\n"
        f"Group: {student['group']}\n"
        f"Student ID: {student['student_id']}\n\n"
        "Application is running successfully!\n"
    )


class StudentHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.respond(200, welcome_message(), "text/plain; charset=utf-8")
        elif self.path == "/api/student":
            self.respond(200, json.dumps(student_information()), "application/json")
        else:
            self.respond(404, "Not found\n", "text/plain; charset=utf-8")

    def respond(self, status, text, content_type):
        body = text.encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)


def main():
    port = int(os.getenv("PORT", "8000"))
    server = ThreadingHTTPServer(("0.0.0.0", port), StudentHandler)
    print(welcome_message(), flush=True)
    print(f"Listening on port {port}", flush=True)
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        server.server_close()


if __name__ == "__main__":
    main()

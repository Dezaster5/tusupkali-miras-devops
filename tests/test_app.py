import json
import os
import threading
import unittest
from http.server import ThreadingHTTPServer
from unittest.mock import patch
from urllib.error import HTTPError
from urllib.request import urlopen

from app.main import StudentHandler


class ApplicationTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.server = ThreadingHTTPServer(("127.0.0.1", 0), StudentHandler)
        cls.thread = threading.Thread(target=cls.server.serve_forever, daemon=True)
        cls.thread.start()
        cls.base = f"http://127.0.0.1:{cls.server.server_port}"

    @classmethod
    def tearDownClass(cls):
        cls.server.shutdown()
        cls.server.server_close()
        cls.thread.join(timeout=5)

    def get(self, path):
        return urlopen(self.base + path, timeout=5)

    def test_default_identity_is_displayed(self):
        with patch.dict(os.environ, {}, clear=True), self.get("/") as response:
            body = response.read().decode()
            self.assertEqual(response.status, 200)
            for expected in ("Miras", "Tusupkali", "IT2-2312", "38366"):
                self.assertIn(expected, body)

    def test_environment_overrides_identity(self):
        environment = {"STUDENT_NAME": "Test", "STUDENT_SURNAME": "Student",
                       "STUDENT_GROUP": "TEST", "STUDENT_ID": "999"}
        with patch.dict(os.environ, environment), self.get("/api/student") as response:
            self.assertEqual(json.load(response), {
                "name": "Test", "surname": "Student", "group": "TEST", "student_id": "999"})

    def test_unknown_route_returns_404(self):
        with self.assertRaises(HTTPError) as error:
            self.get("/does-not-exist")
        self.assertEqual(error.exception.code, 404)

    def test_health_endpoint_supports_container_readiness(self):
        with self.get("/health") as response:
            self.assertEqual(response.status, 200)
            self.assertEqual(json.load(response), {"status": "ok"})


if __name__ == "__main__":
    unittest.main()

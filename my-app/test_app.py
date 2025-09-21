import pytest
from app import app   # نستورد التطبيق من app.py

@pytest.fixture
def client():
    app.testing = True
    with app.test_client() as client:
        yield client

def test_hello_world(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b"Hello, World" in response.data

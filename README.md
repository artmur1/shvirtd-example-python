# Домашнее задание к занятию 5 «Практическое применение Docker» - `Мурчин Артем`

Dockerfile.python - https://github.com/artmur1/shvirtd-example-python/blob/main/Dockerfile.python

compose.yaml - https://github.com/artmur1/shvirtd-example-python/blob/main/compose.yaml

# Доработка от 24.05.2024 г.

compose.yaml собрался без ошибок. На скриншоте видно что работает 4 контейнера.

![alt text](https://github.com/artmur1/shvirtd-example-python/blob/main/img/16-5-03.png)

Но по запросу curl -L http://127.0.0.1:8090 выходит, что сервис не доступен.

![alt text](https://github.com/artmur1/shvirtd-example-python/blob/main/img/16-5-01.png)

Смотрю логи контейнера nginx - start worker process - работает.

![alt text](https://github.com/artmur1/shvirtd-example-python/blob/main/img/16-5-04.png)

Смотрю логи контейнера python: пишет, что не удалось соединиться с Mysql server. Хотя указал логин root и пароль 12345.

![alt text](https://github.com/artmur1/shvirtd-example-python/blob/main/img/16-5-05.png)

Смотрю логи контейнера mysql:8 - MySQL server start ... MySQL server - end. Затем перезагрузка и снова по кругу.

![alt text](https://github.com/artmur1/shvirtd-example-python/blob/main/img/16-5-06.png)

Смотрю логи контейнера haproxy - Loading success; backend 'http_back' has no server available! - Загрузка прошла успешно; У бэкэнда «http_back» нет доступного сервера!

![alt text](https://github.com/artmur1/shvirtd-example-python/blob/main/img/16-5-07.png)

В файле compose.yaml сервисы прописал - где ошибка не пойму. Также в Dockerfile.python прописал данные для подключения к БД - но подключение не идет.

# shvirtd-example-python

Example Flask-application for docker compose training.
## Installation
First, you need to clone this repository:

```bash
git clone https://github.com/netology-code/shvirtd-example-python.git
```

Now, we will need to create a virtual environment and install all the dependencies:

```bash
python3 -m venv venv  # on Windows, use "python -m venv venv" instead
. venv/bin/activate   # on Windows, use "venv\Scripts\activate" instead
pip install -r requirements.txt
python main.py
```
You need to run Mysql database and provide following ENV-variables for connection:  
- DB_HOST (default: '127.0.0.1')
- DB_USER (default: 'app')
- DB_PASSWORD (default: 'very_strong')
- DB_NAME (default: 'example')

The applications will always running on http://localhost:5000.  
To exit venv just type ```deactivate```

## License

This project is licensed under the MIT License (see the `LICENSE` file for details).

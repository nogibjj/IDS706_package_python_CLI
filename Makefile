all: install format lint test

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:	
	black . --line-length 100 --verbose

lint:
	ruff check . --fix --verbose

test:
	python -m pytest -vv .

extract:
	python main.py extract 

load:
	python main.py load

query:
	python main.py query --query-name query1
	python main.py query --query-name query2
	
etl:
	python main.py extract 
	python main.py load
	python main.py query --query-name query1
	python main.py query --query-name query2
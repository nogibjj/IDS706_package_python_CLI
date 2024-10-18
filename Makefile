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
	python mylib/main.py extract 

load:
	python mylib/main.py load

query:
	python mylib/main.py query --query-name query1
	python mylib/main.py query --query-name query2
	
etl:
	python mylib/main.py extract 
	python mylib/main.py load
	python mylib/main.py query --query-name query1
	python mylib/main.py query --query-name query2
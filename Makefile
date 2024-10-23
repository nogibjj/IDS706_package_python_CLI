all: install format lint test

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt &&\
		pip install complex_sql_tool

format:	
	black . --line-length 100 --verbose

lint:
	ruff check . --fix --verbose

test:
	python -m pytest -vv .

extract:
	complex_sql_tool extract

load:
	complex_sql_tool load

query:
	complex_sql_tool query --query-name query1
	complex_sql_tool query --query-name query2
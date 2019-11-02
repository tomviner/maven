.PHONY: isort isort-check black black-check format lint

PACKAGE_NAME=maven


flake8:
	flake8 $(PACKAGE_NAME) tests setup.py

isort:
	isort -rc --atomic $(PACKAGE_NAME) tests setup.py $(ARGS)

isort-check:
	$(MAKE) isort ARGS='--check-only --diff'

black:
	black $(PACKAGE_NAME) tests setup.py $(ARGS)

black-check:
	$(MAKE) black ARGS='--check --diff'


format: black isort

lint: flake8 black-check isort-check


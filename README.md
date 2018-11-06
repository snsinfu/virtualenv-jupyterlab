# Python environment for jupyterlab

Automated jupyterlab virtualenv creation. These packages are installed:

- numpy
- pandas
- matplotlib
- scipy
- scikit-learn
- statsmodels
- gensim
- tensorflow
- keras

## Requirements

- make
- pyenv
- nodejs (for jupyterlab extensions)

## Usage

Run make to create a virtualenv and run jupyterlab:

```console
make
make run
```

## Updating packages

Run `make update` to update Python packages to the latest versions. Then, lock
versions if you find no issue.

```console
make update
make lock
```

Clean and reinstall the environment if updating packages breaks something.

```console
make clean
make
```

## TODOs

- Migrate to pipenv once it is stable enough. Issues:
  - [1914][pipenv-1914]
  - [3086][pipenv-3086]

[pipenv-1914]: https://github.com/pypa/pipenv/issues/1914
[pipenv-3086]: https://github.com/pypa/pipenv/issues/3086

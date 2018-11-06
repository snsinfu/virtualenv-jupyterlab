ARTIFACTS = \
  _env

JUPYTER_OPTIONS = \
  --no-browser \
  --notebook-dir "$${HOME}"

.PHONY: all clean update lock run

all: _env/pip.ok _env/exts.ok
	@:

clean:
	rm -rf $(ARTIFACTS)

update: _env/pip.ok
	_env/bin/pip install -U -r requirements.txt

lock: _env/pip.ok
	_env/bin/pip freeze -r requirements.txt > requirements.lock

run: all
	_env/bin/jupyter lab $(JUPYTER_OPTIONS)

_env/env.ok: .python-version
	pyenv exec python -mvenv _env
	@touch $@

_env/pip.ok: _env/env.ok requirements.lock
	_env/bin/pip install -r requirements.lock
	@touch $@

_env/exts.ok: _env/pip.ok extensions.lock
	xargs -L1 _env/bin/jupyter labextension install < extensions.lock
	@touch $@

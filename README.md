# Packaging

## Local to PyPI

```shell
>> uv version --bump minor 
>> rm -rf dist/* && uv build 
>> uv publish
>> uv run --with holymeow --no-project -- python -c "import holymeow"
>> uv run python

>> uv run src/holymeow/main.py 
```

## GHA to PyPI

```shell
>> uv version --bump patch 

>> git add .
>> git commit -m "up"
>> git push origin master

>> git tag -a v0.1.1 -m "First release"
>> git push origin v0.1.1
```

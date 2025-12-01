# Packaging

## Local to PyPI

```shell
>> uv version --bump patch 
>> rm -rf dist/* && uv build 
>> uv publish
>> uv run --with holymeow --no-project -- python -c "import holymeow"
>> uv run python

>> uv run src/holymeow/main.py 
```

## GHA to PyPI

```shell
>> uv version --bump patch 

# create and push code to branch 
>> git add .
>> git commit -m "up"
>> git push origin main

# create and push tag 
>> git tag -a v0.1.1 -m "release"
>> git push origin v0.1.1
```

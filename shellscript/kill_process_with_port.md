```
sudo kill -9 `sudo lsof -t -i:9001`
```
If that doesn't work you could also use $() for command interpolation:
```
sudo kill -9 $(sudo lsof -t -i:9001)
```

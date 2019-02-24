# Docker YARN

```bash
export YARN_VERSION=10
yarn() {
  docker run --rm -ti -v $(pwd):/data -i reduardo7/yarn:$YARN_VERSION "$@"
}
```

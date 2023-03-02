## [k6](https://github.com/grafana/k6)

TODO

## [Hyperfine](https://github.com/sharkdp/hyperfine) (shell benchmarking tool)

### Install
```
brew install hyperfine
```

### Running Benchmarks

Run a benchmark (it runs 10 times by default):
```
hyperfine 'sleep 0.3'
```

Warmup:
```
hyperfine --warmup 3 'grep -R TODO *'
```

### Parameters

With params variation:
```
hyperfine --prepare 'make clean' --parameter-scan num_threads 1 12 'make -j {num_threads}'
```

With a list of parameters:
```
hyperfine -L compiler gcc,clang '{compiler} -O2 main.cpp'
```

# Tips for improving Ruby performance

## Jemalloc

### How jemalloc works:
- [Repository](https://github.com/jemalloc/jemalloc)
- [Documentation](https://jemalloc.net/jemalloc.3.html)
- [A Scalable Concurrent malloc(3) Implementation for FreeBSD](https://people.freebsd.org/~jasone/jemalloc/bsdcan2006/jemalloc.pdf)

### Verifying that jemalloc is installed:
```
$ MALLOC_CONF=stats_print:true ruby -v

# docker:
$ docker run -it --rm -e "MALLOC_CONF=stats_print:true" <image_name> ruby -v

# output will contain:
__ Begin jemalloc statistics __
```

Check if Ruby is using jemalloc:
```
$ ruby -r rbconfig -e "puts RbConfig::CONFIG['MAINLIBS']"

# or
$ MALLOC_CONF=stats_print:true ruby -e "exit"
```
If you don't reinstall Ruby with `--with-jemalloc` set or [if you're using LD_FLAGS](https://github.com/docker-library/ruby/issues/182), you might not see jemalloc in the output in `RbConfigg::CONFIG`.

### Statistics

Here's a description of stats:
- https://github.com/jemalloc/jemalloc/wiki/Use-Case%3A-Basic-Allocator-Statistics
- [Understanding some jemalloc stats for RocksDB](https://smalldatum.blogspot.com/2022/09/understanding-some-jemalloc-stats-for.html)

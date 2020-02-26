---

typora-root-url: ./
---
# View my built version:
 - [2.25](http://www.j10.monster/Glibc-source-browser/glibc_src_2.25/index.html)
# Glibc-source-browser
```bash
$ mkdir ~/glibc
$ cd $!
$ ./build.sh <version> #make-threads
  # e.g. ./build.sh 2.25 9

# open a new window or remember the directory shown as result above
$ cd
$ git clone https://github.com/woboq/woboq_codebrowser
$ cd woboq_codebrowser
$ ./run.sh <version>
  # e.g. ./run.sh 2.25

```

Follow the instruction, host it with web server, then you will see sth like this:

 ![](/Snipaste_2020-02-25_20-54-25.png)

 ![](/Snipaste_2020-02-25_20-56-55.png)

Have fun!

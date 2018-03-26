# asciidoc-dev-server

Live preview of an asciibinder website.

## How to use

Pull the newest container:

```
$ sudo docker pull asamalik/fedora-docs-dev
```

I recommend to copy the `asciidoc-dev-server.sh` into your `~/bin/` directory:

```
$ cp asciidoc-dev-server.sh ~/bin/
```

And finally, run the script in your ascriibinder source repo:

```
$ cd <your-docs-repo>
$ asciidoc-dev-server.sh
``` 

The website will be available on [localhost:8080](http://localhost:8080). It will refresh automatically with every file change in your docs repo.

### Bug and workaround: if you get errors when running this for the first time, just do:

```
$ mkdir _package
```


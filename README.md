# getvba

A web interface for olevba, a script included in [oletools](https://github.com/decalage2/oletools).
You can extract VBA macros from your *.xlsm files, without running Microsoft Excel.

## how to build

```sh
git clone git@github.com:takehiko/getvba.git
cd getvba
git checkout apline
docker build -t takehiko/getvba:alpine .
```

## running

```sh
docker run --rm -d -p 8000:8000 --name getvba takehiko/getvba:alpine
```

## browsing

<span>http</span>://(docker host):8000/cgi-bin/vba

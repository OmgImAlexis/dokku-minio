# Run Minio on Dokku

## What is Minio
Minio is an object storage server, and API compatible with Amazon S3 cloud storage service.
Read more at the [minio.io](https://www.minio.io/) website.

## What is Dokku
The smallest PaaS implementation you've ever seen - _Docker powered mini-Heroku_
Read more at the [Dokku](http://dokku.viewdocs.io/dokku/) website

## How to Setup

### Requirements
- A working Dokku host - [(Installation Instructions)](http://dokku.viewdocs.io/dokku/installation/)

### Create the app
Log onto your Dokku Host to create the minio app
```bash
dokku apps:create minio
```

### Set Environment Variables
minio uses an **access key** and **secret key** for login, and object management. You can set custom keys with _[Environment Variables](https://github.com/dokku/dokku/blob/master/docs/configuration-management.md)_. If the keys aren't set Minio will generate them.
```
dokku config:set minio MINIO_ACCESS_KEY=AKIAIOSFODNN7EXAMPLE
dokku config:set minio MINIO_SECRET_KEY=wJalrXUtnFEMI/K7MDENG/EXAMPLEKEY
```
**Note:** you can find the minio generated keys by checking app logs, with: `dokku logs minio`

### Create your Dockerfile
```
git clone https://github.com/OmgImAlexis/dokku-minio.git && cd dokku-minio
```

### Add Dokku remote, and Deploy
```
git remote add dokku dokku@YOUR_DOKKU_HOST.com:minio
git push dokku master
```

### Add Persistent/External Storage
```
su dokku
mkdir /home/dokku/minio/data
exit
dokku storage:mount minio /home/dokku/minio/data:/home/dokku/minio/data
dokku ps:restart minio
```

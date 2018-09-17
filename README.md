# baeckstudio

## Server setup

### Prerequisites
Ubuntu Server 18.04 LTS minimal

### nginx with letsencrypt
```
apt-get install nginx
apt-get install software-properties-common
apt-get install git
```
# Wait for hostname
```
add-apt-repository ppa:certbot/certbot
apt install python-certbot-nginx
```

### node and angular
```
apt-get install nodejs
apt-get install npm
npm install -g @angular/cli
```

### postgres
```
apt-get install postgresql postgresql-contrib
```

### phoenix framework, erlang and elixir
```
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
apt-get update
apt-get install esl-erlang
apt-get install elixir
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez
```

### project setup
```
git clone https://github.com/with-cheese/baeckstudio.git

```
FOG - A box of spree.
---


* Upgrade
```bash
bundle exec rake railties:install:migrations
bundle exec rake db:migrate
bundle exec rake db:seed
bundle exec rake spree_sample:load
```

- Generate openssl certs

  ```bash
  openssl genrsa -out www.change-me.com.key 2048
  openssl req -new -x509 -key www.change-me.com.key -out www.change-me.com.crt -days 3650 # Common Name:*.change-me.com
  ```

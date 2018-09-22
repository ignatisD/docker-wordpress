# Development environment for Wordpress

*Can be used in production


### Includes

- [Wordpress](https://hub.docker.com/_/wordpress/): the official docker image
- [MySQL 8](https://dev.mysql.com/doc/relnotes/mysql/8.0/en/) as the wordpress database
- [phpMyAdmin](https://www.phpmyadmin.net/) for debugging the database
- [Mailhog](https://github.com/mailhog/MailHog) for an email-catcher client and server
    - Use `mailhog:1025` as the mail server
    - Go to [http://localhost:8025](http://localhost:8025) to see the "caught" mail
- [NGiNX](https://nginx.org) as a reverse proxy in front of everything (or not)
- [RainLoop](http://www.rainloop.net/): for a production mail client (if needed)

------------
Wordpress needs MySQL to work. Everything else is optional and depends on your needs. 

-------------
To use nginx you need to copy the configurations in `nginx/sites-available/` into `nginx/sites-enabled` and edit them to suit your needs.


### TODO

- Start up scripts
- menu.sh
- nginx auto configuration

That's it for now! 

----------

Good luck   
***Ignatios***

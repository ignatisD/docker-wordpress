#!/usr/bin/env bash
if [ ! -f ".env" ]; then
    cp .env.example .env
fi;
if [ ! -f "ssl/server.crt.pem" ] || [ ! -f "ssl/server.key.pem" ]; then
    cp ssl/default/server.crt.pem ssl/server.crt.pem
    cp ssl/default/server.key.pem ssl/server.key.pem
fi;
while true; do
    clear
    echo "==============================="
    echo "===   Wordpress and tools   ==="
    echo "==============================="
    echo "Press [q] to quit this menu"
    echo ""
    echo "1. Start WordPress & MySQL"
    echo "2. Start WordPress container"
    echo "3. Start NGiNX container"
    echo "4. Start MailHog container"
    echo "5. Start phpMyAdmin container"
    echo "6. Start RainLoop container"
    echo "7. Start MySQL container"
    echo "8. Stop all containers on host"
    echo "9. Docker container list (ps)"
    echo "10. Stop all project containers"
    echo "11. Stop MySQL & WordPress"
    echo "12. Stop WordPress container"
    echo "13. Stop NGiNX container"
    echo "14. Stop MailHog container"
    echo "15. Stop phpMyAdmin container"
    echo "16. Stop RainLoop container"
    echo "17. Stop MySQL container"
    echo "0. Hot reload nginx configuration"
    echo ""
    echo -n "Select a number or type a command: "
    read input

    case "$input" in
        1)
            docker-compose up -d mysql wordpress
            ;;
        2)
            docker-compose up -d wordpress
            ;;
        3)
            docker-compose up -d nginx
            ;;
        4)
            docker-compose up -d mailhog
            ;;
        5)
            docker-compose up -d phpmyadmin
            ;;
        6)
            docker-compose up -d rainloop
            ;;
        7)
            docker-compose up -d mysql
            ;;
        8)
            docker stop $(docker ps -a -q)
            docker-compose rm -f
            ;;
        9)
            docker-compose ps
            ;;
        10)
            docker-compose down
            ;;
        11)
            docker-compose stop wordpress mysql
            docker-compose rm -f
            ;;
        12)
            docker-compose stop wordpress
            docker-compose rm -f
            ;;
        13)
            docker-compose stop nginx
            docker-compose rm -f
            ;;
        14)
            docker-compose stop mailhog
            docker-compose rm -f
            ;;
        15)
            docker-compose stop phpmyadmin
            docker-compose rm -f
            ;;
        16)
            docker-compose stop rainloop
            docker-compose rm -f
            ;;
        17)
            docker-compose stop mysql
            docker-compose rm -f
            ;;
        0)
            docker-compose exec nginx bash -c "nginx -t && service nginx reload"
            ;;
        q)
            exit
            ;;
        *)
            eval "$input"
            echo ""
            ;;
    esac
    read -p "Continue to menu..."
done

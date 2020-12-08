# Step by step setup drupal on localhost by docker

- Create ```docker-compose.yml``` file with below content:
    ```yaml
    version: '3.7'
    
    services:
      database:
        container_name: alice_database
        image: mysql:8.0.4
        user: 1000:1000
        volumes:
          - ./mysql/config/my.cnf:/etc/mysql/my.cnf
          - ./mysql/data:/var/lib/mysql
          - ./mysql/logs:/var/log/mysql
        environment:
          - MYSQL_ROOT_PASSWORD=1234567890
          - MYSQL_DATABASE=alice
        ports:
          - 3306:3306
        restart: unless-stopped
        networks:
          - alice-network
      application:
        container_name: alice_application
        image: drupal:latest
        ports:
          - 8080:80
        #volumes:
        #  - ./web/modules:/opt/drupal/web/modules
        #  - ./web/profiles:/opt/drupal/web/profiles
        #  - ./web/sites:/opt/drupal/web/sites
        #  - ./web/themes:/opt/drupal/web/themes
        restart: unless-stopped
        depends_on:
          - database
        networks:
          - alice-network
    networks:
      alice-network:
        driver: bridge
    ```
- Running below code to install Drupal
  ```shell
  $  ./drupal/scripts/compose_build.sh
  $  ./drupal/scripts/compose_start.sh
  ```
- Process to ```localhost:8080``` to install Drupal
- After install successfully, stop container by command
  ```shell
  $ docker-compose down
  ```
- Copy folder /opt/drupal/web from container to host
  ```shell
  $ docker cp <container_id>:/opt/drupal/web .
  ```
- Edit ```docker-compose.yml``` by uncomment below code
    ```yaml
     volumes:
       - ./web/modules:/opt/drupal/web/modules
       - ./web/profiles:/opt/drupal/web/profiles
       - ./web/sites:/opt/drupal/web/sites
       - ./web/themes:/opt/drupal/web/themes
    ```
- Restart container and start custom code. Enjoy!!!

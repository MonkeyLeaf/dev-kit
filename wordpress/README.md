# Step-by-step setup wordpress on localhost by docker

- Copy ```docker-compose.example.yml``` to ```docker-compose.yml``` file with below content:
- Running below code to install Wordpress
  ```shell
  $  ./wordpress/scripts/compose_build.sh
  $  ./wordpress/scripts/compose_start.sh
  ```
- Process to ```localhost``` to see Wordpress
- Copy folder /var/www/html from container to host
```shell
$ docker cp <container_id>:/var/www/html .
```
- After install successfully, stop container by command
  ```shell
  $ ./wordpress/scripts/compose_stop.sh
  ```
- Edit ```docker-compose.yml``` by uncomment below code
  ```yaml
   volumes:
     - ./html:/var/www/html
  ```
- Restart container and start custom code. Enjoy!!!

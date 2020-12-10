# Step by step setup drupal on localhost by docker

- Copy ```docker-compose.example.yml``` to ```docker-compose.yml``` file with below content:
- Running below code to install Drupal
  ```shell
  $  ./drupal/scripts/compose_build.sh
  $  ./drupal/scripts/compose_start.sh
  ```
- Process to ```localhost:8080``` to install Drupal
- Copy folder /opt/drupal/web from container to host
```shell
$ docker cp <container_id>:/opt/drupal/web .
```
- After install successfully, stop container by command
  ```shell
  $ ./drupal/scripts/compose_stop.sh
  ```
- Edit ```docker-compose.yml``` by uncomment below code
  ```yaml
   volumes:
     - ./web:/opt/drupal/web
  ```
- Restart container and start custom code. Enjoy!!!

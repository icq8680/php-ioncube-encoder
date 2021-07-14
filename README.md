# PHP ionCube Encoder
    Small docker image for PHP sources encryption.

## Disclaimer

This is an [evaluation package](https://www.ioncube.com/encoder_eval_download.php). Please purchase a full version.

It is only made for testing purposes. Not affiliated with ionCube Ltd.

You can still use this project's `Dockerfile` as a reference.

## Usage

### Getting an image

#### Pull

Pull the image and save it to your registry with `docker tag`/`docker push`

OR

#### GitLab CI image

Use this image in your `.gitlab-ci.yml` (see example section)

OR (yes!)

#### Dockerfile build

Use this image as a base image in your Dockerfile to create your own one.

### CI Example (PHP 7.4)

It doesn't differ from a common encoder. Run `/opt/ioncube/ioncube_encoder.sh` with the required parameters.

```
job:
  image: registry.gitlab.com/ci-experience/php-ioncube-encoder
  variables:
    PHP_VERSION_STRIPPED: 74
    LICENSE_FILENAME: unlock.php
  before_script:
    - /opt/ioncube/ioncube_encoder.sh --activate
  script:
    - >
      /opt/ioncube/ioncube_encoder.sh -C -"${PHP_VERSION_STRIPPED}" "${SOURCE_PATH}"
      --into "${DIRECTORY}"
      --merge-target
      --with-license "${LICENSE_FILENAME}"
      --passphrase "${PASSPHRASE}"
      --allow-reflection-all
      --copy app/config/overrides.php
      --ignore app/bootstrap/cache/
      --ignore app/vendor/

  after_script:
    - /opt/ioncube/ioncube_encoder.sh --deactivate
```

**Warning:** it is more safe to set all variables in the project's CI/CD settings!

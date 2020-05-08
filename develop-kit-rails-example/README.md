# RAILS EXAMPLE PROJECT

## Running with Docker

- **Step 0: Prepare for setup**
  - Create folder `src` in root project
- **Step 1: Config Environment**
  - Copy file `.env.example` to `.env` in root project
  - Edit the configuration to your liking.
  - Copy `Gemfile` and `Gemfile.lock` from `./config/init` to `./src`
- **Step 2: Install Rails**
  - Running this cmd: `./scripts/compose_build.sh` to install gem rails.
- **Step 3: Generate Rails**
  - Running this cmd: `./scripts/generate_rails.sh` to install gem rails.
- **Step 4: Change owner of src folder**
  - Running this cmd: `./scripts/chown_src.sh` to change owner folder in src.
- **Step 5: Re-build images**
  - Running this cmd: `./scripts/compose_build.sh` to re-build image.
- **Step 6: Install bundle on local host**
  - In root project, running script `./scripts/compose_run.sh sh -c "bundle config set path 'vendor/bundle' && bundle install"` to install.
- **Step 7: Re-change owner of src folder**
  - Running this cmd: `./scripts/chown_src.sh` to change owner folder in src.
- **Step 8: Config databases**
  - Copy file `database.yml` from `./config/database` to `'./src/config`.
- **Step 8: Start services**
  - Running this cmd: `./scripts/compose_start.sh` to start services.
- **Step 9: Setup Database**
  - Running this cmd: `./scripts/compose_exec.sh "bundle exec rails db:setup"` to setup databases.
- **Step 10: Migrate**
  - Running this cmd: `./scripts/compose_exec.sh "bundle exec rails db:migrate"` to migrating tables.
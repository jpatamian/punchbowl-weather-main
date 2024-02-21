# README

I took over this page so I could add some notes/instructions. In order to use User.first, I added a seed User that will need to be added when you spin up the app in order for it to query favorites :)

For the last part of the challenge (API Limits), I decided to go with low level caching. We can discuss this more in person, but I felt it was the right course for this type of application/test setting. I considered implementing tanstack which I know has a good query cache as well as creating a sidekiq job to add the API requests to a queue that can retry, but I thougth that might be going overboard.

I am used to using rspec so I did the best I could with the test suite, but there are likely ways it could have been done better

## Returning your challenge

To return your code challenge:

1. Remove the `node_modules` directories
2. Archive your project as `.zip` or `.tar.gz` file.
3. Email your archived project to your recruiting contact. You may need to upload your
archive to a file sharing service like Dropbox or Google Drive.


## Backend

### Install

Run the following steps in the `backend` directory.

```bash
bundle install
yarn install
```

Run migrations to initialize and seed the sqlite database.

```bash
bin/rails db:migrate
bin/rails db:seed
```

### Tests

Validate your installation by running the tests.

```bash
❯ bin/rake test

## Frontend

### Install

Run the following steps in the `frontend` directory.

```bash
yarn install
```

### Development Server

Run the development server on port 3000 using the following command.

```bash
yarn run dev
```

At this point, you should be able to connect to the weather app at:

<a href="http://localhost:3000" target="_blank">http://localhost:3000</a>.

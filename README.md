# README

----
## Setup Details
1. Run Postgres, sidekiq(sidekiq -c 5) and Redis(redis-server)

2. Migrate, bundle install and start server(rails s)

3. localhost:3000/importers -->  show page to upload csv and view paginated list of items

4. I have edited the sample.csv in the parent folder and it have 31350 rows. User get a message once the csv in parts are assigned to sidekiq background workers. It took around 8-10 seconds for 5 workers to store the file in database.

5. Paginated result can be seen once the page is reloaded when tasks are complete. Success callback from sidekiq workers is not implemented at the moment.

6. Activerecord-import is used for inserting a batch of CSV in a single query. As per the current implementation, number of DB query for inserting the CSV into DB will be equal to number of sidekiq workers assigned. Here it is 5

5. Tests for few functions need to be written along with some more validations if required.
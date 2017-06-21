# Real Estate Rails Application
---
[![CircleCI](https://circleci.com/gh/prio101/realestatetransaction.svg?style=svg)](https://circleci.com/gh/prio101/realestatetransaction)

---
## Steps:
1. `git clone` the repo
2. `cd path/repo` in your computer
3. from the console / terminal write these steps
   ```bash
     $ bundle 
     $ rails db:create
     $ rails db:migrate
     $ rake populate_database:import_data
       # This will populate data from CSV file
       # Wait few moment until terminal shows its done
     $ rspec
       # To test the suit
     $ rails s      
   ```

 **Sqlite** was used as database to limit setting up process.
 **Circle CI** for CI testing
 **Hound CI** for code violation testing

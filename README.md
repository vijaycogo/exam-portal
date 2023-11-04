# Exam Portel

This is an Exam Portal Registration.

## Components

- **Ruby**:
- **RubyonRails**: 
- **Sqlite**: 

# Repo setup process

CLONING OF REPO.

Use ssh mode to clone the repo.

STEP 1: git clone git@github.com:vijaycogo/exam-portal.git
 

## RVM INSTALLATION 

STEP 1: Do follow the below link strictly for rvm installation:

https://zwbetz.com/install-ruby-version-manager-on-mac/
## JRUBY SETUP 

STEP 1: rvm install jruby-9.3.3.0 

STEP 2: rvm list 

STEP 3: rvm --default jruby-9.3.3.0 

STEP 4: rvm use jruby-9.3.3.0 

STEP 5: brew install gems 

STEP 6: sudo gem install rails:6.0.2.1

## Check version
- **ruby --version**:
- **sqlite3 --version**: 
## Getting Started

STEP 7: bundle install  // Inside the project directory code_hall

STEP 8: rails db:migrate

STEP 9: rails webpacker:install  //Ensure Webpacker is correctly set up

STEP 10: rails assets:precompile //Compile your assets:

STEP 11: rails s

STEP 11: rails db:seed  //for creating collage exam and exam window data.

STEP 12: send request from postman using following params
    {
      first_name: "Vijay",
      last_name: "Kumar",
      phone_number: "7654983173",
      college_id: 1,
      exam_id: 2,
      start_time: Time.now
    }



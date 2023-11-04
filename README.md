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

STEP 3: rvm use jruby-9.3.3.0 

STEP 4: brew install gems 

STEP 5: sudo gem install rails:6.0.2.1

## Check version
- **ruby --version**:
- **sqlite3 --version**: 
## Getting Started

STEP 6: bundle install  // Inside the project directory exam-portal

STEP 7: rails db:migrate

STEP 10: rails s

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



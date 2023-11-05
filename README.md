# Exam Portel

This is an Exam Portal Registration.

## Components

- **Ruby**:
- **RubyonRails**: 
- **Sqlite**: 

# Repo setup process

CLONING OF REPO.

Use ssh mode to clone the repo.

STEP 1: git clone https://github.com/vijaycogo/exam-portal.git
 

## RVM INSTALLATION 

STEP 1: Do follow the below link strictly for rvm installation:

https://zwbetz.com/install-ruby-version-manager-on-mac/
## RUBY SETUP 

STEP 1: rvm install ruby-3.0.0 

STEP 2: rvm list 

STEP 3: rvm use ruby-3.0.0 

STEP 4: brew install gems 

STEP 5: gem install rails:7.1.1

## Check version
- **ruby --version**:
- **sqlite3 --version**: 
## Getting Started

STEP 6: bundle install  // Inside the project directory exam-portal

if there is issue of webpacker do the STEP 7 otherwise skip

STEP 7: rails webpacker:install

STEP 8: rails assets:precompile

STEP 9: rails db:migrate

STEP 10: rails db:seed  //for creating collage exam and exam window data.

STEP 11: rails s

STEP 12: send request from postman using following params

{
  first_name: "Vijay",
  last_name: "Kumar",
  phone_number: "7654983173",
  college_id: 1,
  exam_id: 1,
  start_time: Time.now
}



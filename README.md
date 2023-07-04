# Required technologies

* Ruby 3.1.2

* Rails 7.0.6

* PostgreSQL 12.5

# Install WSL (Windows Subsystem for Linux)

1. Make sure you're running Windows 10 version 2004 or later (Build 19041 or later) or Windows 11.

2. Open PowerShell as administrator and run the following command to install WSL with Ubuntu
   distribution: `` wsl --install -d Ubuntu ``

3. After the installation is complete, restart the computer.

4. When you restart, you will be asked to create a username and password for your Ubuntu installation.

5. You can search for "Ubuntu" in the Windows Start menu to open the Ubuntu terminal.


# Installation of Ruby i Rails

1. Open terminal in Ubuntu.

2. Install the dependencies you need to compile Ruby by running the following commands:

- `sudo apt-get update`
- `sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev`

3. Install Ruby 3.1.2 by running the following command:`sudo apt-get install ruby-full=3.1.2`

4. Install Rails 7.0.6 by running:`gem install rails -v 7.0.6`

5. Install PostgreSQL 12.5 for database support by running:`gem install pg -v 12.5`

# Project Configuration

1. Navigate to the project directory using the cd command

2. Install the necessary gems (dependencies) for the project by running the command: `bundle install`

3. Create a database and perform migrations using the following commands:

- `rails db: create`
- `rails db: migrate`

- Start the Rails server by running the command: `rails server`


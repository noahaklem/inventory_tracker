# README

Welcome to Inventory Tracker. A simple way to keep track of all your products inside your warehouse. This application can ADD, EDIT, DELETE a product from a warehouse. You can also manage multiple warehouses. Those warehouses can have multiple products.

# Description
This web application is made to be downloaded onto your own computer. Please use the GitHub repository to fork and clone this web application to you local machine.  

# Fork and Clone
Once forked and cloned, you can open the file on your machine with you favorite code editor. 

# Terminal Commands
Open a new terminal and run the command bundle install to download the dependencies.

Then run rails db:migrate to set up/initialize the database.

# View Test Environment
Follow the terminal command prompts above.

Then run rails db:seed to plant test data into the database.

After that you can run rails s to start a server on your local machine. Follow the instruction, after the prompt, to navigate to the correct port. You will be able to sample the product CRUD actions. There is also CRUD actions for warehouses.

# Test Environment
Follow the terinal command prompts above.

Then run rails db:seed to plant test data into the database. (The seeds uses the "Faker" gem.)

Once completed run rails c to start a 'pry' environment. Here you can play around with the database information using ruby code inside your terminal.



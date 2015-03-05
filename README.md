#Plus More

## Set Up

### Setting up MongoDb

Open two terminal windows. 
In the first window run:

    make mongod

In the second window run:

	mongo
	> var config = {_id: "meteor", members: [{_id: 0, host: "127.0.0.1:27017"}]}
	> rs.initiate(config)

### Install submodules
You need to install and update your submodules that make up this repository.

	git submodule init
	git submodule update

### Install Packages
On your first run, install meteor packages by running ```mrt install``` in each meteor subdirectory.

## Running

### Starting the app
Each app is in it's own subdirectory. ```cd``` into the app you want to run, and run ```make start```

## Updating

### Submodules

	git submodule update
	git submodule foreach git pull origin master

### Packages

	mrt update

## Adding a new submodule

### Creating

Start by creating a new repository on GitHub under the [Plus More](https://github.com/PlusMore) organization

Next, add it as a submodule to the plus-more project. 

	git submodule add git@github.com:PlusMore/<projectName>.git

Just ```cd``` into the new subdirectory and code away.

### Deploying Meteor projects using Modulus

Follow these [instructions](https://modulus.io/codex/meteor_apps).

	NODE_ENV			production
	MONGO_URL			mongodb://plusmore:<password>@candidate.11.mongolayer.com:10410/plusmore
	MONGO_OPLOG_URL		mongodb://oplogger:<password>@candidate.0.mongolayer.com:10412,candidate.11.mongolayer.com:10410/local?authSource=plusmore
	PORT				80	
	ROOT_URL			{{urlFromSetup}}
	MAIL_URL			smtp://postmaster%40plusmoretablets.com:<password>@smtp.mailgun.org:587

Make sure to run ```modulus project restart``` after any changes to environment variables.

# Variantyx Code Challenge 
## 2021 Senior Software Engineering Position

My solution to the problem attempts to separate the application into three separate services: the frontend application, an express.js api, and a mariadb database. 

The frontend handles all user inputs, with core use cases including scrolling and clicking into individual links, which each bring up the abstract for that specfic article. Use cases could also be increased, depending on added functionality. Another use case could include adding new links, as well as deleting current links. If users were added to the application, this would add use cases such as login, registration, forget password, forget user, and delete account. The Frontend currently utilizes a basic accordion (Bootstrap element) interface as the list of articles, where each article is a tab within the accordion. Clicking on each article will open the tab and fetch the appropriate abstract.

The API handles loading the links once the user loads the page for the first time, and currently includes a single route: articles. This route handles loading the **list of article links (/articles)** using the HTTP GET method from the MariaDB database, since we are looking to load the entire list. The route also **handles loading the abstracts from invidual articles (/articles/:type/:id)** using the GET method. The API includes two helper classes as well: a MariaDBClient that handles all connections and queries to a MariaDB database (in our case specifically the local one, but can be used for any) and a WebScraper class. The WebScraper class takes the endpoint for the article and uses the http fetch method to retrieve the text from the webpage. Using a library called jsdom, it then builds the DOM from the webpage and looks for the element containing the abstract text (in this case a div element with id of "enc-abstract"). The text is separated and any extra spaces and lines are removed. 

The database is a MariaDB database, with the schema included to create the table and test data needed to run the application. The docker-compose file included with the project automatically initiates the database schema in the /db folder.

All three services are currently most cohesively run on Docker using docker-compose. The frontend and database are running over separated networks, with the API communicating over both networks. This separates the resources so that the frontend cannot directly communicate with the database. The docker-compose platform is great for development and even small scale production. However, to scale up, all three services could be separated and then run on Docker Swarm. This would allow for the application to then eventually scale if necessary.

The application requires submodules to load, so once the repository is cloned (**git clone https://github.com/sirgallo/variantyxcodechallenge.git**), it is required that the following commands are run in the main directory of the project (**/variantyxcodechallenge**), in order:<br />
- **git submodule init**
- **git submodule update**

This pulls the latest code into the correct directories of the project (the api and app directory). These directories would otherwise remain empty.

To run on docker-compose, simply make sure docker is running on your machine and then run the following in your console:<br />
    - **docker-compose up --build**<br />

To not show output of build, run:<br />
    - **docker-compose up --build -d**<br />

This builds all the dependencies and runs the application.

To shut down the application, run:<br />
    - **docker-compose down --volumes**<br />

This also deletes the volumes created by Docker for the services, so dropping the --volumes tag keeps the volumes on the machine.

Once Docker completes building the services, the Frontend application can be reached at either **'yourhost':2023** or **localhost:2023** (where 'yourhost' could be http://variantyx.com:2023) and the API can be reached at **'yourhost:2022'** or **localhost:2022**. The MariaDB database can be accessed at localhost, with the active port being 2021. The database containing the articles is named objectdb, with access being given to 'testuser' with password 'password'.
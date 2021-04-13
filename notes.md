# Request/Response 

# User makes a request to /donations 

# Rails response: 
    1. config/routes - matches route with controller/action
    2. logic in action will process the request
    3. Controller may interact with model
    4. render view with given data


# for project:
    2 nested routes => show(show page, index page) / new 


# patterns for defining nested routes
    1. define routes config/routes
    2. handle request in our controller 
    3. render data on given view << really minimal changes need to the view >>

nested routes for organizations resource

organization/1/donations
organization/1/donations/new
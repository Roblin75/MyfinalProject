<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>OZ Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link href="../includes/css/class.css" rel="stylesheet"/>
    <link href="../includes/css/mycss.css" rel="stylesheet"/>
</head>
<body>

    <cfparam name="p" default="carousel" />
    <cfset bookstoreFunctions = createObject("bookstore") />
    <cfinclude template="stateinfo.cfm" />
   
    <div id="wrapper" class="container">
        <header id = "topheader" class = "row" style = "text-align: = center">
            <cfinclude template="header.cfm" />
    <cfparam name="searchme" default="">
    <div class = "col-12">
   
    
    

       
    
    <div id="horizontalnav" class="row">
        <cfinclude template="horizontalNav.cfm" />
    <!---   <cfinclude template="navbar.cfm" />--->
        
       
    </div>
    <div id="maincontent" class="row">
        <section id="center" class="col-sm-9 order-last">
            <cfinclude template="#p#.cfm" />
          
          
            
        </section>
        <section id="left" class="col-sm-3 order-first">
            <cfinclude template="genreNav.cfm" />
            
        </section>
    </div>
    <cfinclude template="footer.cfm" />
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</body>
</html>
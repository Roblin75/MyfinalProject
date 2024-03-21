<!DOCTYPE html>
 <html lang="en">
 <head>
 <meta charset="UTF-8">
 <title>My CF home page</title>
 


 <script src="https://cdn.ckeditor.com/ckeditor5/41.2.0/classic/ckeditor.js"></script>
 
 
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/
 dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha38
 4-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK
 8M2HN" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.
 2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM
 9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" cro
 ssorigin="anonymous"></script>
 </head>
 <body>
    <cfparam name="p" default="carousel" />
    <cfparam name="tool" default="addEdit" />
   <!--- <cfinclude template = ˮ#p#.cfmˮ />--->
   
    

<div class = "container">
    <div id = "navarea">
        <cfinclude template="navbar.cfm" />
    </div>
    <div id = "mainarea">
        
        <cfinclude template="#tool#.cfm" />
        <cfinclude template="footer.cfm" />

    </div>
</div>
</body>
</html>
<!---
<cfparam name="p" default="carousel" />

<cfinclude template="header.cfm"/> 


<cfinclude template="horizontalnav.cfm"> 

<cfinclude template= "#p#.cfm"/> 

<cfinclude template="genrenav.cfm"/> 
<cfinclude template="footer.cfm"/> 



    <div id="wrapper" class="container">
    <div id="navarea"> NaV </div>
    <div id="mainarea">
    <cfinclude template="#tool#.cfm" />
   <cfset bookstoreFunctions = createObject("bookstore")/>--->
  
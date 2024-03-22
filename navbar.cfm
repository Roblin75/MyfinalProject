<cfoutput>
    <a href="#cgi.SCRIPT_NAME#/?tool=addEdit">Book Inventory</a>
    <a href="#cgi.SCRIPT_NAME#/?tool=createUUIDS">Create UUIDS</a>
</cfoutput>



<form class="d-flex" action="#cgi.script_name#?p=details" method="post">
    <input class="form-control me-2" type="search" name="searchme" placeholder="Search" 
   aria-label="Search">                
   <button class="btn btn-outline-success" type="submit">Search</button>            
   </form
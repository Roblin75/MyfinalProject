<section>

<cftry>
    <cfset addEditFunctions = createObject("addedit") />
    <div class="row">
    <div id="main" class="col-9">
    Main Area
    </div>
    <div id=”leftgutter” class="col-lg-3 order-first">
    Left side
    </div>
    </div>
    <cfcatch type="any">
    <cfoutput>
    #cfcatch.Message#
    </cfoutput>
  </cfcatch>
</cftry>
<cffunction name="mainForm">
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method
        ="post">
        <label for="isbn13">ISBN13:</label>
        <input type="text" id="isbn13" name="isbn13" valu
        e="" placeholder="ISBN13" />

        <label for=”title”>Book Title</label> 
        <input type=”text” id="title" name=”title” placeholder=”BookTitle/>
        <button type=”submit” class="btn btn-primary">Add Book</button>
        </form>
        </cfoutput>
    </cffunction>
    <cffunction name="sideNav">
        Side Nav
 </cffunction>

</section>
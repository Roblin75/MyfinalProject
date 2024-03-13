<cfdump var="#form#">


<cfset bookinfo = bookstoreFunctions.obtainSearchResults(form.searchme)/>

<cfif bookinfo.recordcount == 0> 
    #noResults()# 
    <cfelseif bookinfo.recordcount == 1> 
    #oneResult()# 
    <cfelse> 
    #manyResults()# 
</cfif>
    

    
    <cffunction name="noResults">
        there were no results found
        
            
    
    </cffunction>
    <cffunction name= "oneResult">
            there was one result
            <cfoutput> 
                <img src="images/#bookinfo.IMAGE[1]#" style="float:left; width:250px; height:250px" 
                />     
                <span>Title: #bookinfo.title[1]#</span> 
                <span>Publisher: #bookinfo.name[1]#</span> 
                </cfoutput>
            
            </cffunction>
    <cffunction name = "manyResults">
            there were many results
            <ol class="nav flex-column">
                4
                Adding Search To Our Front Index Page
               <cfoutput query=”bookinfo”>  
               <li 
               class="nav-item">
                <a class="nav-link" href=”#cgi.script_name#?
                p=details&searchme=#trim(isbn13)#”>
                #trim(title)#
                </a>
                </li> 
               </cfoutput> 
               </ol>
    </cffunction>
    


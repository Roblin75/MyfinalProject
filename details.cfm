
<cfparam name="searchme" default=""/>
<cfparam name = "genre" default = "">

<cfoutput>
     <cfset bookinfo= bookstoreFunctions.obtainSearchResults(searchme, genre)/>
     
 <!---there are #bookinfo.recordcount# books found--->




<!---done to here--->
<cfif bookinfo.recordcount == 0> 
       
        #noResults()#
    
<cfelseif bookinfo.recordcount == 1> 
       
    
        #oneResult()#
    
        
<cfelse> 
        #manyResults()#
        
</cfif>

</cfoutput>





<cffunction name="noResults">
    "there were no results found"
    
        

</cffunction>
<cffunction name= "oneResult">
   
        
    <div class ="row">
    <div class ="col-6">
        <cfoutput>
           
            <div class="container">
                <div class="row">
                    
                    
                    </div>
                </div>

                  

           
            <div class="container">
                <div class="row">
                    <div class= "col">
                     #bookinfo.recordcount# record showing</br></br>
                    <ol class = "nav flex-column">
                        <cfloop query= "bookinfo">
                            <li class = "nav-item">
                                <a class = "nav-link" href = "#cgi.SCRIPT_NAME#?p= details& searchme = #isbn13#">
                                    #title#
                                </a>
                            </li>
                        </cfloop>
                    </div>
                </div>
                <div class ="row">
                  <div class="col">
                    <img src = "images/#bookinfo.image[1]#" style = "width: 100px">
                  </div>
                  <div class="col">
                        title: #bookinfo.title[1]# </br>
                        year: #bookinfo.year[1]#</br>
                        pages: #bookinfo.pages[1]#</br>
      <!---                 publisher: #bookinfo.name[1]#--->
                       
                        
                  </div>
                </div>
                <div class = "row">

                    <div "class" = "col">
                
                  
                    Description: #bookinfo.description#</br>
                  </div>
                </div>
              </div>
          <!---          <img src = "images/#bookinfo.image[1]#" style = "width: 100px">
                    
                       
                   <div> title: #bookinfo.title# </br>
        
                    <span>year: #bookinfo.year#</span>
                    
                    Description: #bookinfo.description#</br>
                   
                </div>
            </div>--->
        </cfoutput>
        
</cffunction>
<cffunction name = "manyResults">
    <cfoutput>
    
    <div>
        <div>
            
            #bookinfo.recordcount# records showing
        </div>
    <div>
        <ol class="nav flex-column">
            <cfoutput query="bookInfo">  
                <li class="nav-item">
                <a class="nav-link" href=”#cgi.script_name#?"p=details&searchme=#trim(isbn13)#”>
                    #trim(title)#
                </a>
              </li> 
            </cfoutput>
            </ol>
        </div>
    </div>
       
    </cfoutput>
       
</cffunction>


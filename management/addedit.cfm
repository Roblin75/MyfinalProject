
<cftry><cfdump var = "#form#"/>
   
    
    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>
  
   

    
    <div class="row">
    <div id="main" class="col-9">
   
        
        <cfoutput> #mainForm()#</cfoutput>
        
        
    </div>

    
    <div id=”leftgutter” class="col-lg-3 order-first">
        <cfoutput> #sideNav()#</cfoutput>
        
  
    </div>
</div>
    <cfcatch type="any">
    <cfoutput>
        #cfcatch#
    </cfoutput>
  </cfcatch>
</cftry>

        
<cffunction name="mainForm">
    <cfset allPublishers = addEditFunctions.allPublishers() />

   
  
    <cfdump var =  #allPublishers#/>

    <cfoutput>
                <form action="#cgi.script_name#?tool=addedit" method="post" enctype="multipart/form-data">
                    
                    <div class="form-floating mb-3">
                
                        <input type="text" id="isbn13" name="isbn13" value="" placeholder="ISBN13" class="form-control"/>
                        <label for="isbn13">ISBN13:</label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="text" id="title" name="title" placeholder="title" class="form-control"/>
                        <label for="title">Book Title:</label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="number" id="isbn10" name="isbn10"  placeholder="isbn 10" class="form-control"/>
                        <label for="isbn10">ISBN 10: </label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="number" id="year" name="year" placeholder="year of publication" class="form-control"/>
                        <label for="year">Year: </label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="number" id="weight" step= ".1" name="weight" placeholder="weight" class="form-control"/>
                        <label for="weight">Weight: </label>
                    </div>
        
                    <div class="form-floating mb-3">
                        <input type="text" id="binding" name="binding" placeholder="binding" class="form-control"/>
                        <label for="binding">Binding: </label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="number" id="pages" name="pages" placeholder="pages" class="form-control"/>
                        <label for="pages">pages: </label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" id="language" name="language" placeholder="language" class="form-control"/>
                        <label for="language">language: </label>
                    </div>
        
                    <div class="form-floating mb-3">
                        <select id= "publisher" name ="publisher" class="form-control"/>
                        <option value = ""></option>
                        <cfloop query = "allPublishers">
                            <option value = "#Publisherid#">#name#</option>
                        </cfloop>
                        </select>
                        <label for="publisher">publisher: </label>
                        
                    </div>
                    
                    
                        <label for="uploadImage">Upload Cover</label>
                        <div class="input-group mb-3">
                        <input type="file" id="uploadImage" name="uploadImage" class="form-control" />
                        <input type="hidden" name="image" value="#trim(thisBookDetails.image[1])#" />
                    </div>
                 
                 <button type=”submit” class="btn btn-primary" style= "width: 100%">Add Book</button>

                 <div class="row">
                    <div class="col">
                    <label for="uploadImage">Upload Cover</label>
                    <div class="input-group mb-3">
                    <input type="file" id="uploadImage" name="uploadi
                    mage" class="form-control" />
                    <input type="hidden" name="image" value="#trim(thisBookDetails.image[1])#" />
                    </div>
                        </div>
                        <div class="col">
                    <cfif thisBookDetails.image[1].len() gt 0 >
                    <img src="../images/#trim(thisBookDetails.image[1])#" style="width:200px" />
                    </cfif>
                    </div>
                     </div>




                </form>
           </cfoutput>
    </cffunction>
                     
    
    <cffunction name="sideNav">
        <cfset allBooks = addEditFunctions.sideNavBooks() />
        <div>
        Book List
        </div>
        <cfoutput>
        <ul class="nav flex-column">
        <li class="nav-item">
        <a href="#cgi.script_name#?tool=addedit&book=new" class="nav-link">
        New Book
        </a>
        </li>
        <cfloop query="allBooks">
        <li class="nav-item">
        <a href="#cgi.script_name#?tool=addedit&book=#isbn13#" class="nav-link">#trim(title)#</a>
        </li>
        </cfloop>
        </ul>
        </cfoutput>
    </cffunction>
        
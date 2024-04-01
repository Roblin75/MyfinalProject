<cftry>
    
   
    <cfparam name="book" default = ""/>  
    <cfparam name= "qterm" default=""/>
 
   
  
   <!--- <cfdump var = "#form#"/>--->
  
    
    <cfset addEditFunctions = createObject("addedit") />
    <cfset addEditFunctions.processForms(form)>
  
   

    
    <div class="row">
    <div id="main" class="col-9">
   
     
        <cfif book.len() gt 0>
            <cfoutput>#mainForm()#</cfoutput>
        </cfif>
    </div>
        
        
        
    

    
    <div id="leftgutter" class="col-lg-3 order-first">
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

    
    
    <cfset var = thisBookDetails = addEditFunctions.bookDetails(book)/>
    <cfset var = allPublishers = addEditFunctions.allPublishers()/> 
    <cfset var = allGenres = addEditFunctions.allgenres() />
    <cfset var = allGenresForThisBook = addEditFunctions.bookGenres(book)/>
    
    <cfoutput>   
        
        <form action="#cgi.script_name#?tool=addedit&book = #book#&qterm =  #qterm#" method="post" enctype="multipart/form-data">
       
                    <div class="form-floating mb-3">
                    </div>

                    <div class="form-floating mb-3">
                    </div>
                    <div class="form-floating mb-3">
                    </div>
                    <div class="form-floating mb-3">
                    </div>
                    <div class="form-floating mb-3">
                    </div>
                    
                
                        <input type="text" id="isbn13" name="isbn13" value="#thisbookdetails.isbn13[1]#" placeholder="ISBN13" class="form-control"/>
                        <label for="isbn13">ISBN13:</label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="text" id="title" name="title" value="#thisbookdetails.title[1]#" placeholder="title" class="form-control"/>
                        <label for="title">Book Title:</label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="number" id="isbn10" name="isbn10" value="#thisbookdetails.isbn10[1]#" placeholder="isbn 10" class="form-control"/>
                        <label for="isbn10">ISBN 10: </label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="number" id="year" name="year" value="#thisbookdetails.year[1]#" placeholder="year of publication" class="form-control"/>
                        <label for="year">Year: </label>
                    </div>
                
                    <div class="form-floating mb-3">
                        <input type="number" id="weight" step= ".1" name="weight" value="#thisbookdetails.weight[1]#" placeholder="weight" class="form-control"/>
                        <label for="weight">Weight: </label>
                    </div>
        
                    <div class="form-floating mb-3">
                        <input type="text" id="binding" name="binding" value="#thisbookdetails.binding[1]#" placeholder="binding" class="form-control"/>
                        <label for="binding">Binding: </label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="number" id="pages" name="pages" value="#thisbookdetails.pages[1]#" placeholder="pages" class="form-control"/>
                        <label for="pages">pages: </label>
                    </div>
                    
                    <div class="form-floating mb-3">
                        <input type="text" id="languages" name="languages" value="#thisbookdetails.languages[1]#"placeholder="languages" class="form-control"/>
                        <label for="languages">language: </label>
                    </div>
       
                    <div class="form-floating mb-3">
                        <select class="form-select" id="publisherId" name="publisherid" aria-label="Publisher Select Control">
                     <!---   <option value="#id#" #id = thisBookDetails.publisherid ? "selected" : ""#</option>--->
                        <cfloop query="allPublishers">
                        <option value="#id#">#name#</option>
                        </cfloop>
                        </select>
                        <label for="publisher">Publisher</label>
                        </div>
                    
                      
                       
                    <div class="row">
                        <div class="col">
                            <label for="uploadImage">Upload Cover</label>
                    <div class="input-group mb-3">
                        <input type="file" id="uploadImage" name="uploadimage" class="form-control" />
                        <input type="hidden" name="image" value="#trim(thisBookDetails.image[1])#" />
                    </div>
                </div>
                <div class="col">
                    <cfif thisBookDetails.image[1].len() gt 0>
                        <img src="../images/#trim(thisBookDetails.image[1])#" style="width:200px" />
                    </cfif>
                </div>
            </div>

                    <div class="form-floating mb-3">
                        <div>
                        <label for="description">Description</label>
                        </div>
                        <textarea id="description" name="description">
                        <cfoutput>#thisBookDetails.description#</cfoutput>
                        </textarea>
                        <script>
                        ClassicEditor
                        .create(document.querySelector('##description'))
                        .catch(error => {console.dir(error)});
                        </script>
                        </div>
                        <div>
                            <h4>Genres</h4>
                        <cfloop query = "allGenres">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="#id#" id="genre#id#" name="genre">
                                <label class="form-check-label" for="genre#id#">
                                  
                                  #name#
                                </label>
                            </div>
                        </cfloop>
                        <cfloop query = "allGenresForThisBook">
                               
                               <script type = "text/javascript">
                               try{
                                    document.getElementById("genre#genreId#").checked=true;
                               }catch(err){
                               
                               }   
                               </script>
                            </cfloop>    
                    </div>
        
        
                           
                        
                
                    </cfoutput>
                     <button type=”submit” class="btn btn-primary" style= "width: 100%">Add Book</button>

                
                        </div>
                       
                     
             
        </form>
    
 
   
</cffunction>
<cffunction name="sideNav">
    <cfset allBooks = addEditFunctions.sideNavBooks(qterm) />
    <div>
    Book List
    </div>
  
    <cfoutput>
        #findBookForm()#
    <ul class="nav flex-column">
    <li class="nav-item">
        <a class="nav-link" href="#cgi.SCRIPT_NAME#?tool=addEdit&book=new">New Book</a>

    </a>
    </li>
    <cfif qTerm.len() == 0>
        No Search Term Entered
    <cfelseif allbooks.recordcount ==0>    
        No Results Found
    <cfelse>
        <cfloop query="allbooks">
            <li class="nav-item">
                <a class="nav-link" href="#cgi.SCRIPT_NAME#?tool=addEdit&book=#isbn13#&qTerm=#qTerm#">#trim(title)#</a>
            </li>
        </cfloop>
    </cfif>
</ul>
</cfoutput>
</cffunction>



 

    <cffunction name="findBookForm">
        <cfoutput>
        <form action="#cgi.SCRIPT_NAME#?p=details" method=”post”>
            
        <div class="form-floating mb-3">
        <input type="text" id="qterm" name="qterm" cl
        ass="form-control" value="#qterm#" placeholder="Enter a searc
        h term to find a book to edit" />
        <div id = "row"></div>
            <div id = "row">
                <label for="qterm">Search Inventory </label>
        </div>
        </form>
        </cfoutput>
        </cffunction>
    
                     
    
 <!---


 --->
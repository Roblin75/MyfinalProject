
<cfparam name= "qterm"default=""/>
<cftry>
<cfparam name="book" default = ""/>  
 
   
  
    <cfdump var = "#form#"/>
  
    
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
    <cfset thisBookDetails = addEditFunctions.bookDetails(book)/>
    

   
 
   <cfdump var =  #thisbookDetails#/>

    <cfoutput>
                <form action="#cgi.script_name#?tool=addedit&book = #book#" method="post" enctype="multipart/form-data">
                    
                    <div class="form-floating mb-3">
                
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
                        <select id= "publisher" name ="publisher" value="#thisbookdetails.publisher[1]#"class="form-control"/>
                        <option value = ""></option>
                        <cfloop query = "allPublishers">
                            <option value = "#Publisherid#">#name#</option>
                        </cfloop>
                        </select>
                        <label for="publisher">publisher: </label>
                        
                    </div>
                    <div class="col">
                   
                        <img src="../images/" style="width:200px" />
                        
                        </div>
                    <div class="row">
                        <div class="col">
                    
                    
                        <label for="uploadImage">Upload Cover</label>
                        <div class="input-group mb-3">
                        <input type="file" id="uploadImage" name="uploadImage" class="form-control" />
                        <input type="hidden" name="image" value="" />
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
                 
                 <button type=”submit” class="btn btn-primary" style= "width: 100%">Add Book</button>

                
                        </div>
                       
                     </div>




                </form>
           </cfoutput>
</cffunction>
                     
    
    <cffunction name="sideNav">
        
        <cfset allBooks = addEditFunctions.sideNavBooks(qterm) />
        
        <div>
        Book List
        </div>
        <cfoutput>
            #findBookForm()#
            </cfoutput>
        <cfoutput>
        <ul class="nav flex-column">
        <li class="nav-item">
        <a href="#cgi.script_name#?tool=addedit&book=new" class="nav-link">
        New Book
        </a>
        </li>

       <cfif qterm.len()==0>
            No Search Term Entered
            <cfelseif allBooks.recordcount==0>
            No Results Found
        <cfelse>
        <cfloop query="allBooks">
        <li class="nav-item">
        <a href="#cgi.script_name#?tool=addedit&book=#isbn13#" class="nav-link">#trim(title)#</a>
        </li>
        </cfloop>
        </cfif>
        </ul>
        </cfoutput>
    </cffunction>

    <cffunction name="findBookForm">
        <cfoutput>
            <form action="#cgi.script_name#?tool=#tool#" method="post">
            <div class="form-floating mb-3">
            <input type="text" id="qterm" name="qterm" class="form-control" value="#qterm#" placeholder="Enter a searc
            h term to find a book to edit" />
            <label for="qterm">Search Inventory </label>
            </div>
            </form>
        </cfoutput>
    </cffunction>
        
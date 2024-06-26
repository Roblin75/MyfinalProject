component{
    
    <!---  writedump(formData);--->
    function processForms(required struct formData) {
        writedump(formData);
      
        if (formData.keyExists('isbn13') &&formData.isbn13.len() ==13 && formData.keyExists('title') && 
            formData.title.len() > 0){
             

            if(formdata.keyExists("uploadImage") && formData.uploadImage.len()){
                arguments.formData.image = uploadBookCover();
                
            }  


            if(formData.keyExists("genre")){
                deleteAllBookGenres(formData.isbn13);
                formData.genre.listToArray().each(function(item){
                insertGenre(item, formData.isbn13);
                });
                }
            var qs = new query(datasource = application.dsource);
            qs.setSql("if NOT EXISTS( SELECT * FROM books WHERE isbn13=:isbn13)
            INSERT INTO books (isbn13,title) VALUES (:isbn13,:title);
            UPDATE books SET
                title=:title,
                weight=:weight,
                isbn10=:isbn10,
                year=:year,
                binding =:binding,
                languages=:languages,
                pages=:pages,
                image=:image,
                description=:description,
                publisherid=:publisherid
                WHERE isbn13=:isbn13
                ");

      qs.addparam(
          name="isbn13",
          cfqsltype="CF_SQL_VARCHAR",
          value= trim(formData.isbn13),
          null = formData.isbn13.len() !=13
      );
          
      qs.addparam(
          name="title",cfqsltype="CF_SQL_NVARCHAR",
          value= trim(formData.title),
          null=formData.title.len()==0
          
      );
          
      qs.addParam(
            name = 'weight',
            cfsqltype = 'CF_SQL_DECIMAL',
            value = trim(formData.weight),
            null = !isValid('numeric', formData.weight)
       );
      qs.addParam(
              name="binding",CFSQLTYPE="CF_SQL_NVARCHAR",
              value= (formData.binding),
              null = !isValid("numeric", formData.binding)
      );
      qs.addParam(
          name="isbn10",CFSQLTYPE="CF_SQL_NVARCHAR",
          value=formData.isbn10);
          null = !isValid("numeric", formData.isbn10);
  
      qs.addParam(
        name = 'year',
                cfsqltype = 'CF_SQL_INTEGER',
                value = trim(formData.year),
                null = !isValid('numeric', formData.year)
            );
         

      qs.addParam(name = 'pages',
            cfsqltype = 'CF_SQL_INTEGER',
            value = trim(formData.pages),
            null = !isValid('numeric', formData.pages)
        );

      
        qs.addParam(name="image",CFSQLTYPE="CF_SQL_NVARCHAR",
            value=formData.image);
     

        qs.addParam(name="languages",cfsqltype = "CF_SQL_NVARCHAR",
          value = trim(formData.languages)
          );
          
    
      qs.addParam(
              name = "description",
              cfsqltype = "CF_SQL_NVARCHAR",
              value = trim(formData.description),
              null = trim(formData.description).len() == 0
          );
          qs.addParam(
              name = 'publisherId',
              cfsqltype = 'CF_SQL_NVARCHAR',
              value = trim(formData.publisherid),
              null = trim(formData.publisherid).len() != 35
          );
        qs.execute();
    
        

    if(formData.keyExists("genre")){
        deleteAllBookGenres(formData.isbn13)
        formData.genre.listToArray().each(function( item ){
        insertGenre( item, formData.isbn13 )
        })
            
        
      
        }
     }
    
    
    }

  function sideNavBooks( qterm ){
      
      var qs = new query(datasource = application.dsource);
      qs.setSql("select * from books where title like :qterm
      order by title");
      qs.addParam(name="qterm",
      value='%#qterm#%'
      );
      return qs.execute().getResult();
      }

  function allPublishers(){
          
          var qs = new query( datasource = application.dsource );
          qs.setSql("select* from publishers order by name");
              return qs.execute().getResult();
          }

  function uploadBookCover(){
          var imageData = fileUpload(expandPath("../images/"),"uploadImage","*","makeUnique");
  
         return imageData.serverFile;
      
  }
   function bookDetails(book){
          var qs = new query(datasource=application.dsource)
          qs.setSql("select * from books where isbn13=:isbn13 order by title");
          qs.addParam(name="isbn13", CFSQLTYPE="CF_SQL_NVARCHAR",
           
            value=trim (arguments.book));
        <!---    null=(formData.isbn13).len() !=13--->

   
            return qs.execute().getResult();
    
      }

    function allGenres(isbn13){
          
        var qs = new query( datasource = application.dsource );
        qs.setSql("select* from genres order by name");
        return qs.execute().getResult();

      }
   
    
 
function insertGenre(genreid, bookid){
    var qs = new query(datasource = application.dsource);
    qs.setSql("insert into genreToBook(bookid, genreid) VALUES (:bookid, :genreid)");
    qs.addParam(name="bookid",value= arguments.bookid);
    qs.addParam(name="genreid",value= arguments.genreid);
    
    qs.execute();
}

function  deleteAllBookGenres(bookid){
        var qs = new query(datasource = application.dsource);
        qs.setSql("delete from genreToBook where bookid = :bookid ");
        qs.addParam(name= "bookid" ,value= arguments.bookid);
        
        qs.execute();
    

   }
function bookGenres(bookId){
    var qs = new query(datasource = application.dsource);
    qs.setSql("select * from genreToBook where bookid=:bookid ");
    qs.addParam(name="bookid",value= arguments.bookid);
    return qs.execute().getResult();



}
   

}





component{
    
    <!---  writedump(formData);--->
    function processForms(required struct formData) {
       
        if (formData.keyExists('isbn13') &&formData.isbn13.len() ==13 && formData.keyExists('title') && formData.title.len() > 0) {

            if(formdata.keyExists("uploadImage") && formData.uploadImage.len()){
                arguments.formData.image = uploadBookCover();
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
          value=formData.title,
          null=formData.title.len()==0 );
          
      qs.addParam(
          name="weight",CFSQLTYPE="CF_SQL_NUMERIC",
          value=formData.weight);
          null = !isValid("numeric", formData.weight);
      qs.addParam(
              name="binding",CFSQLTYPE="CF_SQL_NVARCHAR",
              value=formData.binding);
              null = !isValid("numeric", formData.binding);

      qs.addParam(
          name="isbn10",CFSQLTYPE="CF_SQL_NVARCHAR",
          value=formData.isbn10);
          null = !isValid("numeric", formData.isbn10);

      qs.addParam(name="year",CFSQLTYPE="CF_SQL_NUMERIC",
          value=formData.year);
          null = !isValid("numeric", formData.year);

      qs.addParam(name="pages",CFSQLTYPE="CF_SQL_NUMERIC",
          value=formData.pages);
          null = !isValid("numeric", formData.pages);

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
      }
  }

  function sideNavBooks( qterm ){
      
      var qs = new query(datasource = application.dsource);
      qs.setSql("select * from books where title like :qterm
      order by title");
      qs.addParam(name="qterm",value='%#qterm#%');
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
          var qs = new query(datasource=application.dsource);
          qs.setSql("select * from books where isbn13=:isbn13 order by title");
          qs.addParam(
            name="isbn13",
            CFSQLTYPE="CF_SQL_NVARCHAR",
            value=trim(arguments.book)
             null=formData.isbn13.len() !=13
          
         
          return qs.execute().getResult();
           
      }
    }
  
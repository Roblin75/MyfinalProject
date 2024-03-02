component{
    function processForms( required struct formData ){
            if ( formData.keyExists( "isbn13" ) && formData.isbn13.len()==13 
                && formData.title.len() > 0 ) {
                var qs = new query( datasource = application.dsource );
                
                qs.setSQL("
                IF NOT EXISTS( SELECT * FROM books WHERE isbn13=:isbn13)
                INSERT INTO books (isbn13,title) VALUES (:isbn13,:title);
                UPDATE books SET
                title=:title,
                weight=:weight,
                year=:year,
                pages=:pages
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
            
        qs.addParam(name="weight",CFSQLTYPE="CF_SQL_NUMERIC",
            value=formData.weight);
            null = !isValid("numeric", formData.pages)

        qs.addParam(name="year",CFSQLTYPE="CF_SQL_NUMERIC",
            value=formData.year);
            null = !isValid("numeric", formData.pages)

        qs.addParam(name="pages",CFSQLTYPE="CF_SQL_NUMERIC",
            value=formData.pages);
            null = !isValid("numeric", formData.pages)
        
        
        qs.execute();
        }
    }

    function sideNavBooks(){
            
            var qs = new query( datasource = application.dsource );
            qs.setSql("select* from books");
             return qs.execute().getResult();
            }
    function allPublishers(){
            
            var qs = new query( datasource = application.dsource );
            qs.setSql("select* from publishers order by name");
                return qs.execute().getResult();
            }
    }
        
                
           


 


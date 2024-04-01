
component {

    function obtainSearchResults(searchme, genre){
        var qs = new query(datasource=application.Dsource);
        
       qs.setsql(" select * from books inner join publishers on books.publisherid=publishers.id where title
        like '%#trim(searchme)#%' or isbn13 like '%#trim(searchme)#%'");

         
        qs.addparam(name= "searchme", value = "%#searchme#%");
        qs.addparam(name= "isbn13e", value = "#searchme#");
       
        return qs.execute().getResult();
    
         
     

        
        var qs = new query(datasource=application.dsource);
        qs.setsql("select * from books inner join genreToBook on books.isbn13= genreToBook.bookid
        where genretobook.genreid= :genreid")
        qs.addParam(name = "genreid",value = arguments.genre)
        return qs.execute().getResult();
    
}
    function genresInStock(){
        var qs = new query(datasource=application.dsource);
        qs.setsql("select distinct name, genreid from genreToBook 
        inner join genres on genreToBook.genreid=genres.id
        order by genres.name");
        return qs.execute().getResult();


    }
            
}

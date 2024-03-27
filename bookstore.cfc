
component {

    function obtainSearchResults(searchMe){

     
   

    
        var qs = new query(datasource=application.dsource);
         qs.setsql("select * from books where title like :searchme  or isbn13=:searchme ;")

         
        qs.addparam(name= "searchme", value = "%#searchme#%");
        qs.addparam(name= "isbn13e", value = "#searchme#");
       
        return qs.execute().getResult();
    
         
     
    }
     function showOneResult() {
        
    
        return "howdy";
    
       
    }
            
}

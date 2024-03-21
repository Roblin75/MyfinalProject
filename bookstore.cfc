
component {
    
function obtainSearchResults(searchMe){
    

    var qs = new query(datasource=application.dsource);
    qs.setsql("select * from books
    inner join publishers on books.publisherid = publishers.id
     where title like :searchme ")
    qs.addparam(name= "searchme", value = "%#searchme#%")
 <!---   qs.addparam(name= "isbn13", value = "#searchme#");--->
    return qs.execute().getResult();

    
 
}
 function showOneResult() {
    



   
}
        
} 
 

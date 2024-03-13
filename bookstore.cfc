
component {
    
function obtainSearchResults(){
    "select * from books inner join publishers on books.publisher=publishers.id
    where title like '%#trim(form.searchme)#%' or 
    isbn13 like '%#trim(searchme)#%'"


 
}

        
} 
 

this is new account.cfm


<cfparam name="AccountMessage" default="" />



<script type = "text/javascript">
 
       

    function validateNewAccount(){
        let originalPassword = document.getElementById("password").value;
        let confirmPassword = document.getElementById("confirmPassword").value;
        console.dir(originalPassword);
        console.dir(confirmPassword);
     <!---   if (originalPassword.length() && originalPassword===confirmPassword){--->
       
        if(originalPassword.length && originalPassword === confirmPassword){
            document.getElementById("accountMessage").innerHTML="";
            document.getElementById("submitPage").click();
       
       

        }else{
            document.getElementById("accountMessage").innerHTML="please check that you have entered your password and you confirm password";
            console.dir("it didnt work");


    }

        
} 
</script>
<cfoutput>
    <div id = "accountMessage" #accountMessage#></div>
    
    

    
    

<form action="#cgi.script_name#?p= login" method="post">
<div class= "form-floating mb-3">
    <input type="text" id="title" name="title" class = "form-control" placeholder="please enter your title"  />
                    <label for="title">title</label>
</div>

<form action="#cgi.script_name#?p= login" 
method="post">
<div class= "form-floating mb-3">
   <input type="text" id="firstName" name="firstName" class = "form-control" placeholder="please enter your first name" required/>
                    <label for="firstName">*firstName</label>
</div>



<div class= "form-floating mb-3">
    <input type="text" id="lastName" name="lastName" class = "form-control" placeholder="please enter your last Name" required/>
                    <label for="lastName">*last Name</label>
</div>



<div class= "form-floating mb-3">
    <input type="text" id="email" name="email" class = "form-control" placeholder="please enter your email address" required />
                    <label for="email">*email</label>
</div>


<div class= "form-floating mb-3">
    <input type="password" id="password" name="password" class = "form-control" placeholder="please enter your password" required/>
    <label for="password">*password</label>


<div class= "form-floating mb-3">
    <input type="text" id="confirmPassword" class = "form-control" placeholder="please re-enter your password" required/>
                    <label for="confirmPassword">*re-enter password</label>
</div>
<div>
    <button type = "button" class = "btn btn-warning" onclick="validateNewAccount()">make new account</button>
 <!---   <input type = "submit" id = "submitPage" style = "display:none"/>--->
    <input type="submit" id="submitPage" style = display:none />
</div>
</form>
</cfoutput>
    



<script type="text/javascript">

    function validateNewAccount(){ 
        let originalPassword = document.getElementById('password').value;
        let confirmPassword = document.getElementById('confirmPassword').value;
        }
        if(originalPassword !== '' && originalPassword === confirmPassword){
            document.getElementById('submitnewaccountform').click();
            document.getElementById('newaccountmessage').innerHTML="";
        } else{
        }




<cfparam name="AccountMessage" default="" />




 
       



        

</script>
<cfoutput>
    <div id = "newaccountMessage"></div> #accountMessage#></div>
    
    
   
    
    

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
   
    <button  type = "button" id="newAccountButton" class="btn btn-warning" type="button" onclick="
    validateNewAccount()"> Make Account </button>
<input type="submit" id="submitNewAccountForm" style="display:none" />
</div>
</form>
</cfoutput>
    

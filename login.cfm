<script type="text/javascRipt">
   function validateNewAccount(){
      let originalPassword = document.getElementById("password").value;
      let confirmPassword = document.getElementById("confirmPassword").value;
      console.dir(originalPassword);
      console.dir(confirmPassword);
 
  
  
   if(originalPassword.length && originalPassword === confirmPassword){
       document.getElementById("newAccountMessage").innerHTML="";
       document.getElementById("submitNewAccountForm").click();
  
  

   }else{
       document.getElementById("accountMessage").innerHTML="please check that you have entered your password and you confirm password";
       console.dir("it didnt work");


   }
}
</script>
 <div class="row">
 <div class="col-6">
    <cfinclude template ="newAccount.cfm"/></div></div>
 <div class="col-6">
 <cfinclude template ="loginform.cfm"/></div>

<cfparam name="newAccountMessage" default="" />
 <cfparam name="LoginMessage" default="" />


 <cfif form.keyExists("firstname")>
   <cfset newAccountResult = bookstoreFunctions.processNewAccount(form)/>
   <cfset newAccountMessage = newAccountResult.message />
   </cfif>

 <div class="row">
    
    <div class="col-lg-6">Left</div>
    <div class="col-lg-6">Right</div>
    </div>
    
  
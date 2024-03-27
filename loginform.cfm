   this is the loginform.cfm
   <h2>log In</h2>
   <cfoutput>
   <div id= "loginmessage" #loginMessage#></div>
   <form action="#cgi.script_name#?p=login" method="post">
    <div class= "form-floating mb-3">
    <input type="text" id="loginemail" name="loginemail" class = "form-control" placeholder="please enter your user Name"  />
    <label for="loginemail">Email</label>
    </div>

    <div class= "form-floating mb-3">
        <input type="password" id="loginpass" name="loginpass" class = "form-control" placeholder="enter password"  />
        <label for="loginpass">password</label>
    </div>  
        <div class= "form-floating mb-3">
        <input type="submit" class = "btn-btn primary" value = "login" style= "width:100%" placeholder="please enter your title"  />
      
    </div>
    </form>                                        
    </cfoutput>
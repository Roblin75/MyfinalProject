<cfset stateFunctions = createObject("stateinfo")/>
<cfset session.clear()/>
<cfif !session.keyExists("user")>
   <cfset session["user"]= stateFunctions.obtainUser()/>
</cfif>


<cfif form.keyExists("firstname")>
   <cfset newAccountResult =stateFunctions.processNewAccount(form)/>
   <cfset  accountMessage=newAccountResult.message/>
</cfif>  
<cfif form.keyExists("loginPass")>
   <cfset userData = stateFunctions.logMeIn(form.loginEmail, form.loginPass) />

<cfif userData.recordcount == 1>
   <cfset session.user = stateFunctions.obtainUser(isUserLoggedIn=1,firstName = userData.firstName,
   lastName = userData.lastName,email = userData.email, isAdmin = userData.isAdmin) />
   <cfset p="carousel">
<cfelse>
   </cfif>
</cfif>
<cfif url.keyExists("p") && url.p =="logoff">
   <cfset session.user= stateFunctions.obtainUser()/>
   <cfset p="carousel">
</cfif>

<cfif p == "logoff">
   <cfset p = carousel/>
</cfif>





   <cfif form.keyExists("loginpass")>
      <cfset userData = stateFunctions.logMeIn(form.loginemail, form.loginpass)>
      
         <cfset session.user =stateFunctions.obtainUser(
         isLoggedIn=1,
         firstName =userData.firstName[1],
         lastName = userData.lastName[1],
         email = userData.email[1],
         acctNumber = userData.personId[1],
         isAdmin = userData.isAdmin[1]
      )/>
      <cfset p="carousel"/>
      <cfelse>
         <cfset loginmessage = "that log in did not work"/>
   </cfif>--->
   
      
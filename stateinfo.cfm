<cfset stateFunctions = createObject("stateinfo")/>
<cfif p == "logoff">
   <cfset p = carousel/>
</cfif>


<cfset session.clear()/>

<cfif !session.keyExists("user")>
   <cfset session["user"]= stateFunctions.obtainUser()/>
</cfif>

<cfif form.keyExists("firstname")>
   <cfset newAccountResult =stateFunctions.processNewAccount(form)/>
   <cfset  accountMessage=newAccountResult.message/>
</cfif>  
   <cfif form.keyExists("loginpass")>
      <cfset userData = stateFunctions.logMeIn(form.loginemail, form.loginpass)>
      <cfif userData.recordCount == 1>
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
   </cfif>
   </cfif>
   
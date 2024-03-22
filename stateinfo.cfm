<cfset stateFunctions = createObject("stateinfo")/>

<cfset session.clear()/>

<cfif !session.keyExists('user')>
   <cfset session.user= stateFunctions.obtainUser()/>
</cfif>
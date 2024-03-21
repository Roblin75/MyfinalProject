<cfset stateFunctions = createObject("stateinfo")/>
<cfset session.clear()/>
<cfdump var ="#session#"/>

<cfif !session.keyExists('user')>
   <cfset session.user= stateFunctions.obtainUser()/>
</cfif>
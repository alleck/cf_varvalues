<!---Ensures that "vars" is set--->
<cfset vars= "" />

<!---Reads the file to find the variables--->
<cffile 
    action = "read" 
    file = "#CGI.PATH_TRANSLATED#"
    variable = "vars">
    
    <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[##][[:graph:]]*[##]", vars)#" />

<!---Output of the variables and their values --->
 <table border="1" cellpadding="3">
 <tr><th>Variable</th><th>Value</th></tr>
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><th>#yar[thisRow]#</th><td>  #Evaluate('#yar[thisRow]#')# </td></tr>
        </cfoutput>
    </cfloop>
</table>

<!--- This section finds variables that have been set in the Application.cf* --->

 <!--- The regex that finds the variables--->
<cfif FileExists("#GetDirectoryFromPath(CGI.Path_Translated)#/Application.cfc") >

 <cffile
    action = "read"
    file = "#GetDirectoryFromPath(CGI.Path_Translated)#/Application.cfc"
    variable = "vars">


    <cfset yar="#REMatchNoCase("[a-zA-Z]pplication.*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
 <table border="1" cellpadding="3">
 <tr><th>Variable set in Application.cf*</th></tr>
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><th>#yar[thisRow]#</th></tr>
        </cfoutput>
    </cfloop>
</table>

 <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[a-zA-Z]ession.*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
 <table border="1" cellpadding="3">
 <tr><th>Variable set in Application.cf*</th></tr>
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><th>#yar[thisRow]#</th></tr>
        </cfoutput>
    </cfloop>
</table>

 <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[dD][sS][nN].*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
 <table border="1" cellpadding="3">
 <tr><th>Variable set in Application.cf*</th></tr>
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><th>#yar[thisRow]#</th></tr>
        </cfoutput>
    </cfloop>
</table>

</cfif>

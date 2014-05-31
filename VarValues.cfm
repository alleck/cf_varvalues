
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
            <tr><th>#yar[thisRow]#</th><td>
        </cfoutput>
	<cfoutput><cfif IsDefined("yar[thisRow]")>#Evaluate('#yar[thisRow]#')#</cfif></cfoutput>
	</td></tr>
    </cfloop>
</table>

<!--- This section finds variables that have been set in the Application.cfc --->

 <!--- The regex that finds the variables--->
<cfif FileExists("#GetDirectoryFromPath(CGI.Path_Translated)#/Application.cfc") >

 <cffile
    action = "read"
    file = "#GetDirectoryFromPath(CGI.Path_Translated)#/Application.cfc"
    variable = "vars">


    <cfset yar="#REMatchNoCase("[a-zA-Z]pplication.*[[:blank:]]", vars)#" />

<br />
<table border="1" cellpadding="3">
<tr><th>Application.cfc is located at</th></tr>
<tr><td><cfoutput>#GetDirectoryFromPath(CGI.Path_Translated)#</cfoutput></td></tr>
</table>

<br />
<!---Output of the variables and their values --->
 <table border="1" cellpadding="3">
 <tr><th>Variable set in Application.cfc</th></tr>
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</th></td>
        </cfoutput>
    </cfloop>

 <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[a-zA-Z]ession.*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</td></tr>
        </cfoutput>
    </cfloop>

 <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[dD][sS][nN].*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</td></tr>
        </cfoutput>
    </cfloop>

<!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[dD]ata[Ss]ourc[eE][[:blank:]][[:graph:]][[:blank:]][[:graph:]]*", vars)#" />

     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</td></tr>
        </cfoutput>
    </cfloop>
</table>


</cfif>


<!--- This section finds variables that have been set in the Application.cfm --->

<!--- The regex that finds the variables--->
<cfif FileExists("#GetDirectoryFromPath(CGI.Path_Translated)#/Application.cfm") >

 <cffile
    action = "read"
    file = "#GetDirectoryFromPath(CGI.Path_Translated)#/Application.cfm"
    variable = "vars">


    <cfset yar="#REMatchNoCase("[a-zA-Z]pplication.*[[:blank:]]", vars)#" />

<br />
<table border="1" cellpadding="3">
<tr><th>Application.cfm is located at</th></tr>
<tr><td><cfoutput>#GetDirectoryFromPath(CGI.Path_Translated)#</cfoutput></td></tr>
</table>

<br />
<!---Output of the variables and their values --->
 <table border="1" cellpadding="3">
 <tr><th>Variable set in Application.cfm</th></tr>
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</th></td>
        </cfoutput>
    </cfloop>

 <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[a-zA-Z]ession.*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</td></tr>
        </cfoutput>
    </cfloop>

 <!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[dD][sS][nN].*[[:blank:]]", vars)#" />

<!---Output of the variables and their values --->
     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</td></tr>
        </cfoutput>
    </cfloop>

<!--- The regex that finds the variables--->
    <cfset yar="#REMatchNoCase("[dD]ata[Ss]ourc[eE][[:blank:]][[:graph:]][[:blank:]][[:graph:]]*", vars)#" />

     <cfloop index="thisRow" from="1" to="#arraylen( yar )#">
         <cfoutput>
            <tr><td>#yar[thisRow]#</td></tr>
        </cfoutput>
    </cfloop>
</table>
</cfif>

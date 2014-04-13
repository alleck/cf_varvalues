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

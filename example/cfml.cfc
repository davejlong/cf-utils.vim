<cfcomponent>
	<cffunction name="processName">
		<cfargument name="name" type="string">
		<cfargument name="option" type="string">
		<cfif option == 'useTestName'>
			<cfreturn 'testName'>
		</cfif>
		<cfreturn name>
	<cffunction>

  <cffunction name="getEmp">
    <cfargument name="name" type="string" />
    <cfquery name="empQuery" datasource="cfdocexamples" >
      SELECT FIRSTNAME, LASTNAME, EMAIL
      FROM tblEmployees
      WHERE name = <cfqueryparam value="#processName(name=Arguments.name, option='useTestName')#" cfsqltype="cf_sql_varchar" />
    </cfquery>
    <cfreturn empQuery>
  </cffunction>

  <cffunction name="getDept">
    <cfargument name="employee" type="string" />
    <cfset var emp = '' />
    <cfscript>
      emp = getEmp(Arguments.employee);
      if( emp.email == 'some-email') return 'Development';
      else return 'Lame-o';
    </cfscript>
  </cffunction>
</cfcomponent>

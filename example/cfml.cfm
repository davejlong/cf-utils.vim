<!--- This is a ColdFusion Comment. Browsers do not receive it. --->

<cfset MyVar = var1 <!--- & var2 --->> 
<cfoutput>#Dateformat(now() <!---, "dddd, mmmm yyyy" --->)#</cfoutput> 

<!--- disable this code 
<!--- display error message ---> 
<cfset errormessage1="Oops!"> 
<cfoutput> 
    #errormessage1# 
</cfoutput> 
--->

<cfoutput>
    Hello #YourName#! <br> 
</cfoutput>


<cfset YourName="Bob">

<cfprocessingdirective pageencoding="euc-jp" />

<!--- Configure dynamic attribute variables. ---> 


<cfparam name="theURL" default="http://www.adobe.com"> 
<cfparam name="resolveURL" default="yes"> 

<!--- Code that dynamically changes values for attributes can go here. ---> 

<!--- Create an arguments structure using variables. ---> 
<cfset myArgs=StructNew()> 
<cfset myArgs.url="#theURL#"> 
<!--- Include a user name and password only if they are available. ---> 
<cfif IsDefined("username")> 
    <cfset myArgs.username="#username#"> 
</cfif> 
<cfif IsDefined("password")>
    <cfset myArgs.password="#password#"> 
</cfif> 
<cfset myArgs.resolveURL="#resolveURL#"> 
<cfset myArgs.timeout="2"> 

<!--- Use the myArgs structure to specify the cfhttp tag attributes. ---> 
<cfhttp attributeCollection="#myArgs#"> 
<cfoutput> 
    #cfhttp.fileContent# 
</cfoutput>

<cfscript>
    param name="paramname" default="value" min="minvalue" max="maxvalue" pattern="pattern" 
</cfscript>

<cfscript> 
    qry = new Query(); 
    qry.setDatasource("test"); 
    qry.setSQL("delete from art where artid=62"); 
    qry.execute(); 
    TRANSACTION action="begin" {
    writeoutput("Transaction in cfscript test"); 
    TRANSACTION action="begin" { 
    qry.setSQL("insert into art(artid, artistid, artname, description, issold, price) 
    values ( 62, 1, 'art12', 'something', 1, 100)"); 
    qry.execute();
    } 
    transactionSetSavepoint("sp01"); 
    qry.setSQL("update art set artname='art45' where artid=62"); 
    qry.execute(); 
    transactionSetSavepoint("sp02"); 
    qry.setSQL("update art set artname='art56' where artid=62"); 
    qry.execute(); 
    transactionrollback("sp02"); 
    transactioncommit(); 
    } 
</cfscript>


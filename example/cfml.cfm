<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf-8>
        <title>Test CFM Script</title>
        <style>

            #someId {
                width:960px;
                height:600px;
            }

            .someClass {
                background-color: #444444;
                background-image: -webkit-gradient(linear, left top, left bottom, from(#444444), to(#999999)); /* Safari 4+, Chrome */
                background-image: -webkit-linear-gradient(top, #444444, #999999); /* Chrome 10+, Safari 5.1+, iOS 5+ */
                background-image:    -moz-linear-gradient(top, #444444, #999999); /* Firefox 3.6-15 */
                background-image:      -o-linear-gradient(top, #444444, #999999); /* Opera 11.10+ */
                background-image:         linear-gradient(to bottom, #444444, #999999); /* Firefox 16+ */
            }

            #someOtherId {
                float: right;
                line-height: 1.3em;
                margin: 0;
                padding: 4px 0 0 10px;

            }

        </style>

        <script type="text/javascript">
            $(document).ready(function () {
                    /* TODO stop id hashes from being recognized as CF */
                    $("#someId, .someClass, #someOtherId").val('');

                    });
</script>
    </head>
    <body>
        <cfset a = 1>
        <cfset print(a + 10, 20)>

        <cfscript>

        function() {
        eetet
        arr = [1, 2, 3, 4, 5];
        str = {key1="one", key2="two", key3="three"};

        function print(int arg1, int arg2)
        {
        for(i = arg1; i <= arg2; i++)
        {
        if(i == 10)
        {
        writeOutput(10);
        }
        else
        {
        writeOutput(i);
        }
        }

        switch(arg1)
        {
        case 1:
        {
        writeOutput("case 1");
        }
        case 2:
        {
        writeOutput("case 2");
        }
        }

        }

        </cfscript>

        <cffunction name="foo" returntype="Any">
        <cfargument name="arg1"/>
        <cfargument name="arg2"/>

        <cfreturn 1>
        </cffunction>

        <cfset a = foo()>
        <cfcatch type="any">
        </cfcatch>
        </cftry>



        <cftry>
        <cfset foo("argument1", "argument11", "argument12", "argument13", "argument14", "argument15", 
        "argument16","argument17", "argument18")>
        <cffeed action="read" source="#source#" name="myfeed" overwrite="true"
        timeout="60" enclosuredir="#dir#">
        <cfset arrayVar = ["Array Content", "Array Content", "Array Content", "Array Content", 
        "Array Content","Array Content", "Array Content", "Array Content"]>
        <cfset structVar = {a1="struct data", a2="struct data", a3="struct data", a4="struct data", 
        a5="struct data",a6="struct data", a7="struct data"}>

        <cfscript>

        public function foo(Stirng a1, Stirng a11, Stirng a12, Stirng a13, Stirng a14, Stirng a15, 
        Stirng a16,Stirng a17, Stirng a18)
        {
        if(isDefined(a10) && isDefined(a11) && isDefined(a12) && isDefined(a13) && isDefined(a14) && isDefined(a15) 
        && isDefined(a16) && isDefined(a17) && isDefined(a10))
        {
        writeOutput("hello");
        }
        }

        </cfscript>

        <cfoutput>
        This is just plain text over here. This text should be wrapped based on maximux column width when 
        wrap option for text is selected.
        </cfoutput>
        <cfcatch type="any">
        </cfcatch>
        </cftry>





        <!--- Press gg=G to test indenting --->

        <div id=someId class=someClass>
            <table>
                <tr>
                    <th>Test Header</th>
                </tr>
                <tr>
                    <td>Test Table Cell</td>
                </tr>
            </table>
        </div>
    </body>
</html>

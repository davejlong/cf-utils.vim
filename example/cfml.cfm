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

    <script>
        $(document).ready(function () {
            /* TODO stop id hashes from being recognized as CF */
                $("#someId, .someClass, #someOtherId").val('');

        });
    </script>
</head>
<body>
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

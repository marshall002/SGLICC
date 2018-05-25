<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="pages_personal_admin_Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    
    <script src="../../../plugins/jquery-datepicker/jquery-1.12.4.js"></script> 
    <script src="../../../plugins/jquery-datepicker/jquery-ui.js"></script>
    <link href="../../../plugins/jquery-ui-1.12.1.custom/jquery-ui.min.css" rel="stylesheet" />   
    <script src="../../../plugins/jquery-datepicker/datepicker-es.js"></script>
    <script>
  $( function() {
    $( "#datepicker" ).datepicker({
      showButtonPanel: true
    });
  } );
  </script>


</head>
<body>
    <form id="form1" runat="server">
        <div>

            <p>Date: <input type="text" id="datepicker"/></p>


        </div>
    </form>
</body>
</html>

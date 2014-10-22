<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Start.aspx.cs" Inherits="Start" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Let's Start!</title>



    
    <style type="text/css">
    .back
    {
        background-attachment:fixed;
        background-color:rgba(255,255,255,0);
    }
      .butt
    {
        font-family:'Open Sans Condensed';
        font-weight:bold;
        font-size:medium;
        
    }   
    .teal
    {
        color:Teal;
    }
     
    span:hover
    {
        color:White;
        -webkit-transition: all 0.5s ease-in-out;
        -moz-transition: all 0.5s ease-in-out;
        -o-transition: all 0.5s ease-in-out;
        -ms-transition: all 0.5s ease-in-out;
        transition: all 0.5s ease-in-out;
    }
    
    /*BLUR*/
.blur img {
  -webkit-transition: all 1s ease;
     -moz-transition: all 1s ease;
       -o-transition: all 1s ease;
      -ms-transition: all 1s ease;
          transition: all 1s ease;
}

.blur img:hover {
  -webkit-filter: blur(3px);
}
    
/*MORPH*/
.morph {
  -webkit-transition: all 0.5s ease;
     -moz-transition: all 0.5s ease;
       -o-transition: all 0.5s ease;
      -ms-transition: all 0.5s ease;
          transition: all 0.5s ease;
}
 
.morph:hover {
  border-radius: 50%;
  -webkit-transform: rotate(360deg);
     -moz-transform: rotate(360deg);
       -o-transform: rotate(360deg);
      -ms-transform: rotate(360deg);
          transform: rotate(360deg);
}    
    
    
/*B&W*/
.bw {
  -webkit-transition: all 1s ease;
     -moz-transition: all 1s ease;
       -o-transition: all 1s ease;
      -ms-transition: all 1s ease;
          transition: all 1s ease;
}
 
.bw:hover {
  -webkit-filter: grayscale(100%);
}    
    
    </style>

<link href="css/carousel.css" rel="stylesheet"/>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700' rel='stylesheet' type='text/css'>
     <link rel=Stylesheet type="text/css" href="css/bootstrap.css"/>
     <link rel=Stylesheet type="text/css" href="css/hover.css"/>
     <%--<link rel=Stylesheet type="text/css" href="css/jumbotron.css"/>--%>
   <%--  <link rel=Stylesheet type="text/css" href="css/sticky-footer.css"/>--%>
    <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
     <script src=”js/bootstrap.js”></script>
    




</head>
<body background="Images/soccer-arch.jpg" class="back" >
    <form id="form1" runat="server">
    <center>
    <div style="padding-top:100px;opacity:0.8">
     <asp:Label ID="Label_nopl" class="btn btn-danger" style="width:50%;text-align:center;font-family:Open Sans;font-size:35px;font-weight:lighter" text="Enter here!" runat="server"></asp:Label></div>
    <div class="blur pic hover" style="margin-top:50px">
    <a href="Auction.aspx"><img src="Images/6.png"  style="width:400px;height:600px;border-width:thick;opacity:1;"/></a>
    </div>
    </center>
    
    <%--<center><img src="Images/6.png"  style="width:400px;height:600px;border-color:White;border-width:thick;opacity:1;"/></center>--%>
    </div>
    </form>
</body>
</html>
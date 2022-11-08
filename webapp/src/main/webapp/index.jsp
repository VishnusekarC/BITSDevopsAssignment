Hello, World! Version 2 test!! New changes to test automatic polling!! Test again!
<HTML>
    <HEAD>
    <TITLE>Background Image</TITLE>
    </HEAD>
    
    <BODY background="image.jpg">
    <SCRIPT>
      function validate() {
        if (document.getElementById("findname")[0].value=="") {
          alert("Please Enter the Name !");
          return false;
        }
        var user = document.getElementById("findname").value;
        alert("Hi"+ user +", Welcome to BITS Pilani!");
        return true;
      }
    </SCRIPT>
    <FORM onSubmit="return validate()">
    <P><BR><BR><BR>
    <FONT COLOR="white" SIZE="4">Enter the Name:
    <INPUT TYPE="text" NAME="name" id="findname" size="35" VALUE="" >
    <BR><BR>
    <INPUT TYPE=SUBMIT VALUE="Submit">
    <BR>
    <B><FONT COLOR=BLACK SIZE=4>
    </TABLE>
    </FORM>
    </BODY>
</HTML>    
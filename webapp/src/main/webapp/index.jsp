Hello, World! Version 2 test!! New changes to test automatic polling!! Test again!
<HTML>
    <HEAD>
    <TITLE>BITS Login</TITLE>
    </HEAD>
    
    <BODY background="image.jpg" 
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;>
    <SCRIPT>
      function validate() {
        if (document.forms[0].name.value=="") {
          alert("Please Enter the Name!");
          return false;
        }
        alert("Welcome to BITS Pilani!");
        return true;
      }
    </SCRIPT>
    <FORM onSubmit="return validate()">
    <P><BR><BR><BR>
    <FONT COLOR="white" SIZE="4">Enter the Name:
    <INPUT TYPE="text" NAME="name" size="35" VALUE="">
    <BR><BR>
    <INPUT TYPE=SUBMIT VALUE="Submit">
    <BR>
    <B><FONT COLOR=BLACK SIZE=4>
    </TABLE>
    </FORM>
    </BODY>
</HTML>    
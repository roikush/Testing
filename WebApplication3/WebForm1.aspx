<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #81f1f5;
            color: #333;
            font-size: 1.3em;
            margin: 0;
            padding: 0;
        }

        form {
            width: 60vw;
            margin: 5vw 20vw;
            background-color: #eefef4;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        table {
            width: 55vw;
        }

        td {
            padding: 10px;
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            box-sizing: border-box;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            color: #555;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            padding: 15px 35px;
            cursor: pointer;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        input[type="text"]:disabled {
            background-color: #ddd;
        }

        .result {
            display: none;
            color: #dc3545;
            font-size: 14px;
            margin-top: -10px;
        }
    </style>

    <form method="post" runat="server" onsubmit="return check();">
        <table>
            <tr>
                <td>user name</td>
                <td><input type="text" id="uName" name="uName" /></td>
                <td><input type="text" id="userNameResult" disabled class="result" /></td>
            </tr>
            <tr>
                <td>first name</td>
                <td><input type="text" id="fName" name="fName" /></td>
                <td><input type="text" id="firstNameResult" disabled class="result" /></td>
            </tr>
            <tr>
                <td>last name</td>
                <td><input type="text" id="lName" name="lName" /></td>
                <td><input type="text" id="lastNameResult" disabled class="result" /></td>
            </tr>
            <tr>
                <td>email</td>
                <td><input type="text" id="email" name="email" /></td>
                <td><input type="text" id="EmailResult" disabled="disabled" class="result" /></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center";>
                    <input type="submit" name="submit" value="submit" />
                </td>
            </tr>
        </table>
    </form>

    <script>
        function check() {


            var email = document.getElementById("email").value;
            var size = email.length;
            var atSign = email.indexOf('@');
            var dotSign = email.indexOf('.');
            var msg = "";

            if (size < 6 || size > 30) {
                msg = "כתובת מייל קצרה או ארוכה מדי";
            }

            else if (atSign == -1) {
                msg = "סימן @ לא קיים בכתובת";
            }
            
            else if (atSign != email.lastIndexOf('@')) {
                
                msg = "אסור יותר מ - @ 1 במייל";
            }
            else if (atSign < 2 || email.lastIndexOf('@') == size - 1) {
                msg = "סימן @ לאיכול להיות ראשון או אחרון";
            }
            else if (email.indexOf('.') == 0 || email.indexOf('.') == size - 1) { 
                msg = "נקודה לא יכולה להיות תו ראשון או אחרון בכתובת";
            }
            else if (email.charAt(atSign+2)=='.'){
                msg = "נקודה חייבת להיות לפחות שני תווים אחרי סימן ה-'@'";
            }
            

            alert(msg);
            if (msg != "") {
                document.getElementById("EmailResult").value = msg;
                document.getElementById("EmailResult").style.display = "inline";
                    
            }

            else {
                document.getElementById("EmailResult").style.display = "none";
            }


            msg = null;

            var name = document.getElementById("uName").value;
            if (isQuot(name) != true) {
                msg = "user name can't contain quot marks";
            }

            if (msg != "") {
                document.getElementById("userNameResult").value = msg;
                document.getElementById("userNameResult").style.display = "inline";
            }
            else
                document.getElementById("userNameResult").style.display = "none";




            msg = null;

            var name = document.getElementById("fName").value;
            if (isQuot(name) != true) {
                msg = "first name can't contain quot marks";
            }

            if (msg != "") {
                document.getElementById("firstNameResult").value = msg;
                document.getElementById("firstNameResult").style.display = "inline";
                
            }
            else
                document.getElementById("firstNameResult").style.display = "none";



            msg = null;

            var name = document.getElementById("lName").value;
            if (isQuot(name) != true) {
                msg = "last name can't contain quot marks";
            }

            if (msg != "") {
                document.getElementById("lastNameResult").value = msg;
                document.getElementById("lastNameResult").style.display = "inline";
                return false;
            }
            else
                document.getElementById("lastNameResult").style.display = "none";



            alert("email = " + email);
           
        }

        function isQuot(name) {

            var quot1 = '\"',quot2="\'";
        
            if (name.indexOf(quot1) != -1 || name.indexOf(quot2) != -1)
                return false;
            return true;
           
            }

    </script>
</asp:Content>

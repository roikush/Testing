using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string st = "";
        protected void Page_Load(object sender, EventArgs e) {
            {
                if (Request.Form["submit"] != null){
                    
                        st += "<table dir='ltr' border = '1'>";
                        st += "<tr><thcolspan='2'>הפרטים שהתקבלו</th></tr>";
                        string uName = Request.Form["uName"];
                        string fName = Request.Form["fName"];
                        string lName = Request.Form["lName"];
                        string mail = Request.Form["email"];
                        st += "<tr><td>user name: </td><td>" + uName + "</td></tr>";
                        st += "<tr><td>first name: </td><td>" + fName + "</td></tr>";
                        st += "<tr><td>last name: </td><td>" + lName + "</td></tr>";
                        st += "<tr><td>email: </td><td>" + mail + "</td></tr>";

                        st += "</table>";

                        Response.Write(st);
                    }
                }
            }   
        }
    }


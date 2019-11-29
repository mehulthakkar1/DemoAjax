<%@ Page Language="C#" AutoEventWireup="true" Codebehind="Default.aspx.cs" Inherits="DemoAjaxApp._Default"%>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ajax Demo</title>

    <script language="javascript" type="text/javascript">
			 
			function CallTest()
			{
				var id=document.getElementById('txtClientId').value;
				_Default.Test(id);
			}
			function NameLength(obj)
			{
				var i=0;
				var newdiv = document.getElementById('EmpData');
				newdiv.innerHTML = "";
				if(obj == null)
				{	
			        newdiv.innerHTML = "No Employee Found";
			        return;
			    }
				mytable = document.createElement("table");
				mytable.cellSpacing = "0px";
				mytable.style.border = "1px solid #000";
				mytablebody = document.createElement("tbody");
				mycurrent_row = document.createElement("tr");
				for(i=0;i<obj.Rows[0].Columns.length;i++)
				{
						mycurrent_cell = document.createElement("td");
						currenttext = document.createTextNode(obj.Rows[0].Columns[i].Name);
						mycurrent_cell.appendChild(currenttext);
						mycurrent_cell.style.border = "1px solid #000";
						mycurrent_row.appendChild(mycurrent_cell);
				}	
				mytablebody.appendChild(mycurrent_row);	
				for(var j=0;j<obj.RowCount;j++)
				{
					var objRow = obj.Rows[j];
					mycurrent_row = document.createElement("tr");
					for(i=0;i<objRow.Columns.length;i++)
					{
						mycurrent_cell = document.createElement("td");
						if(objRow.Columns[i].Value != null)
							currenttext = document.createTextNode(objRow.Columns[i].Value + " ");
						else
							currenttext = document.createTextNode(" ");
						mycurrent_cell.appendChild(currenttext);
						mycurrent_cell.style.border = "1px solid #000";
						mycurrent_row.appendChild(mycurrent_cell);
					}
					mytablebody.appendChild(mycurrent_row);
				}
				mytable.appendChild(mytablebody);
				newdiv.appendChild(mytable);
								
			}
			function Error_Test(obj)
			{
				alert(obj.ErrMsg);
			}
			function CallTest1()
			{
			    var x = new Array();
			    x[0] = "Mehul";
			    x[1] = "Thakkar";
			    _Default.PassArrayObject(x);
			}
			function ReturnClassObject(obj)
			{
			    alert(obj.Name);
			}
			function Error_PassArrayObject(obj)
			{
				alert(obj.ErrMsg);
            }

            function CallReturnEvenOdd() {
                var id = document.getElementById('txtNumber').value;
                var msg = _Default.ReturnEvenOdd(id);
                alert(msg);
            }

			function CallTest2()
			{
			    var x = new Object();
			    x.Name = "Mehul-Thakkar";
			    x.Phone = 25460645;
			    x.Email = "mehult@xyz.com";
			    x.JoiningDate = "15-09-2010";
			    _Default.PassClassObject(x);
			}
			function ReturnLength(obj)
			{
			    alert(obj);
			}
			function Error_PassClassObject(obj)
			{
				alert(obj.ErrMsg);
            }

			function CallBack_ReturnArray(arrObj) {
            
			    var Total=0;
			    for(var i in arrObj)
			        Total+=parseInt(arrObj[i],10);
			        
			    alert(Total);
            }
            function ReturnStrArray() {
                _Default.ReturnStrArray().then(function(arrObj) {
                    var str = '';
                    for (var i in arrObj)
                        str += arrObj[i] + "\n";

                    alert(str);
                });
            }
        	function CallBack_ReturnObject(clsObj)
			{
			    alert(clsObj.Email);
			}
		    function CallBack_ReturnFArray(arrObj)
			{
			    var Total=0;
			    for(var i in arrObj)
			        Total+=parseFloat(arrObj[i],10);
			        
			    alert(Total);
		    }

		    function CallBack_GenericCollection(collObj) {
		        for (var item in collObj) {
		            alert("Name: " + collObj[item].Name + "\nPhone: " + collObj[item].Phone + "\nEmail: " + collObj[item].Email);
		        }
		    }

		    function ServiceCall() {
		        SmartAjax.CallService(
                "http://localhost:2830/TestService.svc/GetData",
                '{ "value": "' + document.getElementById("txtServiceBox").value + '" }',
                { onSuccess: "serviceCallback", onError: "serviceError" }
                );
		    }

		    function serviceCallback(str) {
		        alert(str);
		    }

		    function serviceError(str) {
		        alert(str);
		    }

				
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            <div style="border: solid 1px yellow">
                Enter Emp No Here:
                <input type="text" id="txtClientId" />
                <a href="#" onclick="CallTest()">Retrieve Emp</a>
                <div id="EmpData">
                </div>
            </div>
            <br />
            <div style="border: solid 1px blue">
                Pass Array Object:
                <a href="#" onclick="CallTest1()">Click Here</a>
                <div id="Div1">
                </div>
            </div>
            <br />
            <div style="border: solid 1px green">
                Pass Class Object:
                <a href="#" onclick="CallTest2()">Click Here</a>
                <div id="Div2">
                </div>
            </div>
            <br />
            <div style="border: solid 1px orange">
                Return Array Object:
                <a href="#" onclick="_Default.ReturnArray()">Click Here</a>
                <div id="Div3">
                </div>
            </div>
            <br />
            <div style="border: solid 1px brown">
                Return String Array Object:
                <a href="#" onclick="ReturnStrArray()">Click Here</a>
                <div id="Div5">
                </div>
            </div>
            <br />
            <div style="border: solid 1px pink">
                Return Double Array Object:
                <a href="#" onclick="_Default.ReturnFArray()">Click Here</a>
                <div id="Div6">
                </div>
            </div>
            <br />
            <div style="border: solid 1px gray">
                Return Class Object:
                <a href="#" onclick="_Default.ReturnObject()">Click Here</a>
                <div id="Div4">
                </div>
            </div>
            <br />
            <div style="border: solid 1px silver">
                Synchronous Call using AJAX:
                <input type="text" id="txtNumber" />
                <a href="#" onclick="CallReturnEvenOdd()">Click Here</a>
                <div id="Div7">
                </div>
            </div>
            <br />
            <div style="border: solid 1px #aecfa5">
                Generic Support:
                <a href="#" onclick="_Default.GenericCollection()">Click Here</a>
                <div id="Div8">
                </div>
            </div>
            <br />
            <div style="border: solid 1px #2ec2d7">
                Restful Service Call:
                <input type="text" id="txtServiceBox" />
                <a href="#" onclick="ServiceCall()">Click Here</a>
                <div id="Div9">
                </div>
            </div>
            <br />
            <div style="border: solid 1px red">
            Access this textbox from Ajax dll
            <asp:TextBox runat="server" ID="txt"></asp:TextBox>
            <a href="#" onclick="_Default.ControlAccess()">Get Error</a>
            </div>
        </div>
       
        <asp:UpdatePanel runat="server" ID="UP1">
            <ContentTemplate>
                <asp:TextBox runat="server" ID="txt1">
                </asp:TextBox>
                <asp:Button runat="server" ID="b1" Text="click here" OnClick="b1_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>

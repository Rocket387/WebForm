<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ACWebForm.WebForm1" %>  
    <!DOCTYPE html>  
    <html xmlns="http://www.w3.org/1999/xhtml">  
  
     
    <head runat="server">
    <title>Closure on Transfer Application Form</title>
    
    <style type="text/css">
        .auto-style1 {
            font-family: Arial;
             text-align: center;
            width: 800px;
            height: 315px;
            margin-left:auto;
            margin-right:auto;
        }
        .auto-style6 {
            font-family: Arial;
            font-weight: bold;
            font-size: xx-large;
            height: 31px;
            text-align: center;
        }
        .auto-style12 {
            font-family: Arial;
            text-align: left;
            height: 31px;
            width: 946px;
        }
        .newStyle1 {
            font-family: Arial;
            text-align: center;
        }
        .auto-style21 {
            font-family: Arial;
            text-align: center;
            width: 13px;
        }
        .auto-style24 {
            font-family: Arial;
            text-align: center;
            width: 2759px;
        }
        .auto-style26 {
            font-family: Arial;
            text-align: center;
            width: 2759px;
            height: 112px;
        }
        .auto-style27 {
            font-family: Arial;
            text-align: left;
            height: 29px;
            width: 946px;
        }
        .auto-style28 {
            font-family: Arial;
            vertical-align: top;
            text-align: left;
            width: 2759px;
        }
        .auto-style29 {
            font-family: Arial;
            text-align: left;
            height: 32px;
            width: 946px;
        }
        .auto-style30 {
            font-family: Arial;
            text-align: left;
            width: 946px;
        }
        .auto-style31 {
            font-family: Arial;
            text-align: left;
            width: 946px;
        }
        .auto-style32 {
            font-family: Arial;
            vertical-align: top;
            text-align: center;
            width: 2759px;
        }
        .auto-style33 {
            font-size: small;
        }
        .auto-style34 {
            font-size: small;
            border-left-color: #A0A0A0;
            border-right-color: #C0C0C0;
            border-top-color: #A0A0A0;
            border-bottom-color: #C0C0C0;
            padding: 1px;
        }
        </style>
</head>
<body>
    <asp:Image ID="TNALOGO" runat="server" ImageUrl="~/images/TNALOGO.png" />
    <form id="form1" runat="server">
        
        <div>
            <table class="auto-style1">
                <tr class="newStyle1">
                    <td class="auto-style6" colspan="2" font-names="Arial">Closure on Transfer Web Form</td>
                </tr>

                <tr class="newStyle1">
                    <td class="auto-style24">&nbsp;</td>
                    <td class="auto-style31">
                        <br />
                        <br />
                    </td>
                </tr>
                <tr class="newStyle1">
                    <td class="auto-style24">Transferring Body *</td>
                    <td class="auto-style31">
                        
                        
                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                        <ajaxToolkit:ComboBox ID="ComboBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" Height="30px" MaxLength="0" style="display: inline;" Width="600px" AutoCompleteMode="SuggestAppend">     
                          </ajaxToolkit:ComboBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Transfer_App_Form %>" SelectCommand="SELECT [Name] FROM [Organisations]"></asp:SqlDataSource>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="CustomValidator1" ControlToValidate="ComboBox1"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                        <asp:SqlDataSource ID="Department" runat="server" ConnectionString="<%$ ConnectionStrings:Transfer_App_Form %>" SelectCommand="SELECT [Name] FROM [Organisations]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr class="newStyle1"><td class="auto-style24"><br/></td></tr>
                <tr class="newStyle1">
                    <td class="auto-style24">Person Responsible *</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox1" runat="server" Width="370px" Font-Names="Arial" Height="30px"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="Please enter a person responsible" ControlToValidate="TextBox1"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                </tr>
               <tr class="newStyle1"><td class="auto-style24"><br/></td></tr>
                <tr class="newStyle1">  
                            <td colspan="2">  
                                <br /> </td>  
                        </tr>  
                        <tr class="newStyle1">  
                            <td class="auto-style24">Select<br />
                                &nbsp;Lettercode: *<br />
                                <br />
                            </td>  
                            <td class="auto-style30">  
                                
                        <ajaxToolkit:ComboBox ID="ddlletter_code" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlletter_code_SelectedIndexChanged" Font-Names="Arial" Font-Overline="False" Font-Size="Medium" Height="30px" MaxLength="0" style="display: inline;" Width="300px" AutoCompleteMode="SuggestAppend">
                             </ajaxToolkit:ComboBox>
                                 <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="Please select a lettercode" ControlToValidate="ddlletter_code"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                                
                                <br />
                                
                            </td>  
                        </tr>  
               
                        <tr class="newStyle1">  
                            <td class="auto-style24">&nbsp;Series No:<br />
                                *</td>  
                            <td class="auto-style30">  

                                <asp:DropDownList ID="ddlclass_no" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlclass_no_SelectedIndexChanged" Height="30px" Font-Names="Arial" Font-Size="Medium" Width="370px"> </asp:DropDownList>  
                                <asp:CustomValidator ID="CustomValidator4" runat="server" ErrorMessage="Please select a series number" ControlToValidate="ddlclass_no"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                            </td>  
                        </tr>  
                <br />
                        <tr class="newStyle1">  
                            <td class="auto-style24">&nbsp;Series Description:<br />
                                *<br />
                            </td>  
                            <td class="auto-style30">  
                                <asp:DropDownList ID="ddlclass_title" runat="server" Font-Names="Arial" Font-Size="Medium" Height="30px" Width="800px" ></asp:DropDownList>  
                                <asp:CustomValidator ID="CustomValidator5" runat="server" ErrorMessage="Please select a series description" ControlToValidate="ddlclass_title"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                            </td>  
                        </tr>
                <tr class="newStyle1"><td class="auto-style24"><br/></td></tr>
                <tr class="newStyle1">
                    <td class="auto-style24">Piece Number<br />
                        *</td>
                    <td class="auto-style12">
                        <asp:TextBox ID="TextBox6" runat="server" Width="370px" Font-Names="Arial" Height="30px"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator6" runat="server" ErrorMessage="Please enter piece numbers" ControlToValidate="TextBox6"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                    </td>
                       
                <tr class="newStyle1">
                    <td class="auto-style26">Covering Dates <span class="auto-style34">(Years)</span><br />
                        *</td>
                    <td class="auto-style27">
                        <br />
                        <span lang="EN-US" style="font-size:11.0pt;mso-bidi-font-size:12.0pt;font-family:&quot;Arial&quot;,serif;mso-fareast-font-family:&quot;Arial&quot;;color:black;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:
                        AR-SA">
                        <br />
                        <asp:TextBox ID="TextBox5" runat="server" Width="370px" Font-Names="Arial" Height="30px"></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator7" runat="server" ErrorMessage="Please enter covering years!" ControlToValidate="TextBox5"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                        <br />
                        The covering dates for the closed pieces or items. This should be the first and last years of information in the piece, or parent piece where items are to be closed. Example: 1978-1982</span><span lang="EN-US" style="font-size:11.0pt;mso-bidi-font-size:12.0pt;font-family:&quot;Times New Roman&quot;,serif;mso-fareast-font-family:&quot;Times New Roman&quot;;color:black;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:
                       
                 class="newStyle1"><td class="auto-style21"><br/></td></tr>
                <tr class="newStyle1">
                    <td class="auto-style26">Period closure/ period requesting. <span class="auto-style34">(Years)</span><br />
                        *</td>
                    <td class="auto-style27">
                        <asp:TextBox ID="TextBox3" runat="server" Width="370px" Font-Names="Arial" Height="30px"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator8" runat="server" ErrorMessage="Please enter period closure in years" ControlToValidate="TextBox3"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                        <br />
                        <span lang="EN-US" style="font-size:11.0pt;mso-bidi-font-size:12.0pt;font-family:&quot;Arial&quot;,serif;mso-fareast-font-family:&quot;Arial&quot;;color:black;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:
                        AR-SA">The length of time, in years, from the last date of the piece the information needs to be closed for</span></td>
                </tr>
                <tr><td class="auto-style24"><br/></td></tr>
                <tr>
                    <td class="auto-style24"><span class="newStyle1">FOI Exemption<br />
                        <br />
                        <span class="auto-style33">(Hold down Ctrl to select several FOI)</span><br />
                        *</span></td>
                    <td class="auto-style31">
                        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="FOI1" DataTextField="Name" DataValueField="Name" Height="300px" SelectionMode="Multiple" Width="600px"></asp:ListBox>
                        <asp:CustomValidator ID="CustomValidator9" runat="server" ErrorMessage="Please select a minimum of 1 FOI" ControlToValidate="ListBox1"  OnServerValidate="CustomValidator1_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
                        <asp:SqlDataSource ID="FOI1" runat="server" ConnectionString="<%$ ConnectionStrings:Transfer_App_Form %>" SelectCommand="SELECT [Name] FROM [FOI_Exemptions]"></asp:SqlDataSource>
                        
                    </td>
                </tr>
                <tr><td class="auto-style24">&nbsp;</td></tr>
                <tr><td class="auto-style24"></td></tr>
                <tr>
                    <td class="auto-style32"><span class="newStyle1">Notes<br />
                        <br />
                        <span style="mso-bidi-font-weight:normal"><span style="mso-bidi-font-size: 10.0pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" class="auto-style33">(</span><span lang="EN-US" style="mso-bidi-font-size: 10.0pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA" class="auto-style33">Justification / explanation of what the information is, and why it should remain closed for the period described</span><span style="mso-bidi-font-size: 10.0pt; mso-fareast-font-family: &quot;Times New Roman&quot;; mso-ansi-language: EN-US; mso-fareast-language: EN-US; mso-bidi-language: AR-SA">)</span></span></span></td>
                    <td class="auto-style29">
                        <asp:TextBox ID="TextBox4" runat="server" Height="290px" Width="600px" Font-Names="Arial" TextMode="MultiLine"></asp:TextBox>
    
                   </td>
                </tr>
 
                <tr>
                    <td class="auto-style28">&nbsp;</td>
                    <td class="auto-style29">
                        <asp:Button ID="Button1" runat="server" Height="45px" Text="Submit" Width="170px" OnClick="Button1_Click" Font-Names="Arial" CssClass="newStyle1" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

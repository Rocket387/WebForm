using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;



//using System.Windows.Forms;

namespace ACWebForm
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        SqlConnection objSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ILDBconnection"].ConnectionString);
        
        //cascading combobox linkup
        protected void Page_Load(object sender, EventArgs e)
        {
            if (objSqlConnection.State == ConnectionState.Closed)
            {
                objSqlConnection.Open();
            }
            if (!IsPostBack)
            {
                ddlclass_no.Items.Insert(0, new ListItem("--Select Class number--", "0"));
                ddlclass_title.Items.Insert(0, new ListItem("--Select Class Title--", "0"));
                BindCountries();
            }
        }
        protected void BindCountries()
        {
            try
            {
                SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select * from tbl_lettercode", objSqlConnection);
                DataSet objDataSet = new DataSet();
                objSQLAdapter.Fill(objDataSet);
                ddlletter_code.DataSource = objDataSet;
                
                ddlletter_code.DataTextField = "letter_code";
                ddlletter_code.DataValueField = "lettercode_id";
                ddlletter_code.DataBind();
                ddlletter_code.Items.Insert(0, new ListItem("--Select Lettercode--", "0"));
            }
            catch (Exception ex)
            {
                Response.Write("Exception in Binding Lettercode Dropdownlist : " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }
        }
        protected void ddlletter_code_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int lettercode_id = Convert.ToInt32(ddlletter_code.SelectedValue);
                SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select * from tbl_class where lettercode_id=" + lettercode_id, objSqlConnection);
                DataSet objDataSet = new DataSet();
                objSQLAdapter.Fill(objDataSet);
                ddlclass_no.DataSource = objDataSet;
                ddlclass_no.DataTextField = "class_no";
                ddlclass_no.DataValueField = "class_id";
                ddlclass_no.DataBind();
                ddlclass_no.Items.Insert(0, new ListItem("--Select Class no--", "0"));
                if (ddlclass_no.SelectedValue == "0")
                {
                    ddlclass_title.Items.Clear();
                    ddlclass_title.Items.Insert(0, new ListItem("--Select Class Title--", "0"));
                }
            }
            catch (Exception ex)
            {
                Response.Write("Exception in Binding Class no Dropdownlist: " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }
        }
        protected void ddlclass_no_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int class_id = Convert.ToInt32(ddlclass_no.SelectedValue);
                SqlDataAdapter objSQLAdapter = new SqlDataAdapter("select * from tbl_class where class_id=" + class_id, objSqlConnection);
                DataSet objDataSet = new DataSet();
                objSQLAdapter.Fill(objDataSet);
                ddlclass_title.DataSource = objDataSet;
                ddlclass_title.DataTextField = "class_title";
                ddlclass_title.DataValueField = "class_title";
                ddlclass_title.DataBind();
                ddlclass_title.Items.Insert(0, new ListItem("--Select Class Title--", "0"));
            }
            catch (Exception ex)
            {
                Response.Write("Exception in Binding Class Title Dropdownlist: " + ex.Message.ToString());
            }
            finally
            {
                objSqlConnection.Close();
            }
        }
 
 
        //tells user what is missing from empty input boxes
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator1.ErrorMessage = "Transferring Body is Required!";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator2.ErrorMessage = "Please enter a person responsible";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator3.ErrorMessage = "Please select a lettercode";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator4.ErrorMessage = "Please select a series number";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator5.ErrorMessage = "Please select a series description";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator6.ErrorMessage = "Please enter piece numbers";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator7.ErrorMessage = "Please enter covering years!";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator8.ErrorMessage = "Please enter period closure in years";
                return;
            }

            if (string.IsNullOrEmpty(args.Value.Trim()))
            {
                args.IsValid = false;
                CustomValidator9.ErrorMessage = "Please select a minimum of 1 FOI";
                return;
            }

            

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Transfer_Responses"].ConnectionString);
            SqlCommand cmd;
            //SqlDataReader read;
            //SqlDataAdapter drr;
            //string id;
            bool Mode = true;
            string sql;

            


            string transferringbody = ComboBox1.Text;
            string person = TextBox1.Text;
            string lettercode = ddlletter_code.Text;
            string classno = ddlclass_no.Text;
            string seriesdescription = ddlclass_title.Text;
            string piecenumbers = TextBox6.Text;
            string coveringdates = TextBox5.Text;
            string periodclosure = TextBox3.Text;
            string foiexemption = "";
            string notes = TextBox4.Text;




            if (Mode == true)
            {

                //checks all boxes have an entry
                if (String.IsNullOrWhiteSpace(ComboBox1.Text) || string.IsNullOrWhiteSpace(TextBox1.Text) && String.IsNullOrWhiteSpace(ddlletter_code.Text) || string.IsNullOrWhiteSpace(ddlclass_no.Text) && String.IsNullOrWhiteSpace(ddlclass_title.Text) || string.IsNullOrWhiteSpace(TextBox6.Text)
                   && String.IsNullOrWhiteSpace(TextBox5.Text) || string.IsNullOrWhiteSpace(TextBox3.Text) && String.IsNullOrWhiteSpace(ListBox1.Text))
                {
                    
              
                    MessageBox.Show("Please complete all required fields");
                     return;

                    
                }

                   
                

                //concatenates items selected from listbox so multiple selections are added to the database

                foreach (ListItem item in ListBox1.Items)
                {
                    if (item.Selected)
                    {
                        foiexemption += "\n" + item.Text;
                    }
                }
    
                try
                {
                    sql = "INSERT INTO Form_data(TransferringBody, Person, Lettercode, ClassNo, SeriesDescription,  PieceNumbers, CoveringDates, PeriodClosure, FOIExemption, Notes)" +
                    "values(@TransferringBody, @Person, @Lettercode, @ClassNo, @SeriesDescription, @PieceNumbers, @CoveringDates, @PeriodClosure, @FOIExemption, @Notes)";
                    con.Open();
                    cmd = new SqlCommand(sql, con);

                    //cmd.Parameters.Clear(); 
                    cmd.Parameters.AddWithValue("@TransferringBody", transferringbody);
                    cmd.Parameters.AddWithValue("@Person", person);
                    cmd.Parameters.AddWithValue("@Lettercode", lettercode);
                    cmd.Parameters.AddWithValue("@ClassNo", classno);
                    cmd.Parameters.AddWithValue("@SeriesDescription", seriesdescription);
                    cmd.Parameters.AddWithValue("@PieceNumbers", piecenumbers);
                    cmd.Parameters.AddWithValue("@CoveringDates", coveringdates);
                    cmd.Parameters.AddWithValue("@PeriodClosure", periodclosure);
                    cmd.Parameters.AddWithValue("@FOIExemption", foiexemption);

                    cmd.Parameters.AddWithValue("@Notes", notes);


                    

                    MessageBox.Show("Record Added");
                    cmd.ExecuteNonQuery();

                    //clears boxes after entry
                    ComboBox1.ClearSelection();
                    TextBox1.Text = string.Empty;
                    ddlletter_code.ClearSelection();
                    ddlclass_no.ClearSelection();
                    ddlclass_title.ClearSelection();
                    TextBox6.Text = string.Empty;
                    TextBox5.Text = string.Empty;
                    TextBox3.Text = string.Empty;
                    TextBox4.Text = string.Empty;

                    Button1.Text = "Submit";
                    Mode = true;

                    
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("An error has occured!" + ex);
                }

            }
           



            con.Close();
        }

        protected void TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

       
    }
}
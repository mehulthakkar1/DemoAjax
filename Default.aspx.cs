using System;
using System.Collections.Generic;
using System.Data;
using Ajax.NET;

namespace DemoAjaxApp
{

    public class Temp
    {
        string _name, _email;
        int _phone;
        DateTime _doj;

        public string Name { get { return _name; } set { _name = value; } }
        public int Phone { get { return _phone; } set { _phone = value; } }
        public string Email { get { return _email; } set { _email = value; } }
        public DateTime JoiningDate{ get {return _doj;} set{ _doj = value;}}

    }
    public partial class _Default : System.Web.UI.Page
    {
        [AjaxMethod("Test", "NameLength", null, "Loading...")]
        public DataTable Test(string Id)
        {
            System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection("server=mehult;Database=mehul;User Id=sa;Password=");
            System.Data.SqlClient.SqlDataAdapter Adp = new System.Data.SqlClient.SqlDataAdapter("Select * from emp where no=" + Id, con);

            DataTable dt = new DataTable();
            try
            {
                Adp.Fill(dt);
                if (dt.Rows.Count > 0)
                    return dt;
                else
                    return null;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        [AjaxMethod("PassArrayObject", "ReturnClassObject", null, "Loading...")]
        public Temp PassArrayObject(string[] str)
        {
            Temp t1 = new Temp();
            foreach (string st in str)
                t1.Name += st;

            return t1;
        }

        [AjaxMethod("PassClassObject", "ReturnLength", null, "Loading...")]
        public int PassClassObject(Temp str)
        {
            return str.Name.Length;
        }

        [AjaxMethod("ControlAccess", false, false, "Loading...")]
        public void ControlAccess(string str)
        {
            txt.Text = str;
        }

        [AjaxMethod(false)]
        public string ReturnEvenOdd(int i)
        {
            if (i % 2 == 0)
                return "Number is Even";
            else
                return "Number is Odd";
        }

        [AjaxMethod(null, true, false, "Loading...")]
        public int[] ReturnArray()
        {
            int[] i ={ 1, 2, 3, 4 };
            return i;
        }

        [AjaxMethod(true, true)]
        public string[] ReturnStrArray()
        {
            string[] str ={ "\\'1\\'", "2", "3", "4" };
            return str;
        }

        [AjaxMethod(null, true, false, "Loading...")]
        public double[] ReturnFArray()
        {
            double[] i ={ 1.423, 2.543, 3.765, 4.65 };
            return i;
        }

        [AjaxMethod(null, true, false, null)]
        public Temp ReturnObject()
        {
            Temp obj = new Temp();
            obj.Name = "hello";
            obj.Phone = 420840;
            obj.Email = "hello@helo.com";
            return obj;
        }

        [AjaxMethod]
        public Dictionary<string, Temp> GenericCollection()
        {
            return new Dictionary<string, Temp> { {"1", new Temp { Email = "test1@helo.com", Name = "test1", Phone = 1234567 }},
             {"2", new Temp { Email = "test2@helo.com", Name = "test2", Phone = 21345 }}};
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Scripts.Add(this);
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            txt1.Text = "hello";
        }
    }
}

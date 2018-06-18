using DataCollection.Infrastructure;
using DataCollection.Models;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;

namespace DataCollection.Controllers
{
    public class LoginController : Controller
    {
        public ActionResult Login()
        {
            ViewBag.InvalidLogin = false;
            return View();
        }


        [HttpPost]
        public ActionResult Login(Login login)
        {
            ViewBag.InvalidLogin = false;

            if (ModelState.IsValid)
            {
                var dt = new DataTable();

                using (SqlConnection connection = new SqlConnection(Config.ConnectionString))
                {
                    SqlCommand command = new SqlCommand("ValidateUser", connection);
                    command.Parameters.AddWithValue("@Username", login.Username);
                    command.Parameters.AddWithValue("@Password", login.Password);
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();

                    var data = new SqlDataAdapter(command);
                    data.Fill(dt);
                    connection.Close();
                    data.Dispose();
                }

                if (dt.Rows.Count > 0)
                    return RedirectToAction("Index", "Home");
                else
                    ViewBag.InvalidLogin = true;
            }

            return View(login);
        }
    }
}

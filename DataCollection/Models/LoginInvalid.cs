using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.ComponentModel.DataAnnotations;



namespace DataCollection.Models
{
    public class LoginInvalid {

        [Required]
        public string Username { get; set; }

        [Required]
        public string Password { get; set; }
    }
}
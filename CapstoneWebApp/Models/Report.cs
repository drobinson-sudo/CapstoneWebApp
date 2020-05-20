using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CapstoneWebApp.Models
{
    public class Report
    {
        public int ReportID { get; set; }
        public DateTime DateCreated { get; set; }
        public DateTime DateLastEdit { get; set; }
        public string Content { get; set; }
    }
}
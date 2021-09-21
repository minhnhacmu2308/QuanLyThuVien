using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyThuVienAsp.Models
{
    public class Booking
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        public DateTime dayBrorrow { get; set; }

        public DateTime dayBack { get; set; }

        public int status { get; set; }

        public virtual User User { get; set; }

        public virtual Book Book { get; set; }
    }
}
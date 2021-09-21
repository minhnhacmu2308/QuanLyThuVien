using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyThuVienAsp.Models
{
    public class Book
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int id { get; set; }

        [StringLength(255)]
        [Required]
        public string name { get; set; }

        [StringLength(255)]
        [Required]
        public string author { get; set; }

        [StringLength(255)]
        [Required]
        public string publisher { get; set; }

        public string content { get; set; }

        [StringLength(255)]
        [Required]
        public string image { get; set; }

        public int status { get; set; }

        public virtual Category Category { get; set; }

        public virtual Branch Branch { get; set; }

        public virtual ICollection<Booking> Bookings { get; set; }
    }
}
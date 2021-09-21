using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace QuanLyThuVienAsp.Models
{
    public class QuanLyThuVienDbContext : DbContext
    {
        public QuanLyThuVienDbContext() : base("QuanLyThuVienConectionString")
        {

        }

        public DbSet<User> users { get; set; }

        public DbSet<Category> categories { get; set; }

        public DbSet<Book> books { get; set; }

        public DbSet<Booking> bookings { get; set; }

        public DbSet<Role> roles { get; set; }

        public DbSet<Branch> branches { get; set; }
    }
}
namespace QuanLyThuVienAsp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cretedatabase : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Bookings",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        dayBrorrow = c.DateTime(nullable: false),
                        dayBack = c.DateTime(nullable: false),
                        status = c.Int(nullable: false),
                        Book_id = c.Int(),
                        User_id = c.Int(),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Books", t => t.Book_id)
                .ForeignKey("dbo.Users", t => t.User_id)
                .Index(t => t.Book_id)
                .Index(t => t.User_id);
            
            CreateTable(
                "dbo.Books",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        author = c.String(nullable: false, maxLength: 255),
                        publisher = c.String(nullable: false, maxLength: 255),
                        content = c.String(),
                        image = c.String(nullable: false, maxLength: 255),
                        status = c.Int(nullable: false),
                        Branch_id = c.Int(),
                        Category_id = c.Int(),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Branches", t => t.Branch_id)
                .ForeignKey("dbo.Categories", t => t.Category_id)
                .Index(t => t.Branch_id)
                .Index(t => t.Category_id);
            
            CreateTable(
                "dbo.Branches",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        email = c.String(nullable: false, maxLength: 255),
                        password = c.String(nullable: false, maxLength: 255),
                        fullName = c.String(nullable: false, maxLength: 255),
                        phoneNumber = c.String(nullable: false, maxLength: 255),
                        status = c.Int(nullable: false),
                        Branch_id = c.Int(),
                        Role_id = c.Int(),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Branches", t => t.Branch_id)
                .ForeignKey("dbo.Roles", t => t.Role_id)
                .Index(t => t.Branch_id)
                .Index(t => t.Role_id);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 255),
                        status = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Books", "Category_id", "dbo.Categories");
            DropForeignKey("dbo.Users", "Role_id", "dbo.Roles");
            DropForeignKey("dbo.Users", "Branch_id", "dbo.Branches");
            DropForeignKey("dbo.Bookings", "User_id", "dbo.Users");
            DropForeignKey("dbo.Books", "Branch_id", "dbo.Branches");
            DropForeignKey("dbo.Bookings", "Book_id", "dbo.Books");
            DropIndex("dbo.Users", new[] { "Role_id" });
            DropIndex("dbo.Users", new[] { "Branch_id" });
            DropIndex("dbo.Books", new[] { "Category_id" });
            DropIndex("dbo.Books", new[] { "Branch_id" });
            DropIndex("dbo.Bookings", new[] { "User_id" });
            DropIndex("dbo.Bookings", new[] { "Book_id" });
            DropTable("dbo.Categories");
            DropTable("dbo.Roles");
            DropTable("dbo.Users");
            DropTable("dbo.Branches");
            DropTable("dbo.Books");
            DropTable("dbo.Bookings");
        }
    }
}

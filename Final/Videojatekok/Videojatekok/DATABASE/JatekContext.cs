using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Videojatekok.MODELS;
using MySql.Data.MySqlClient;

namespace Videojatekok.DATABASE
{
    class JatekContext : DbContext
    {
        public DbSet<Jatekok> Jatekoks { get; set; }
        public DbSet<Fejlesztok> Fejlesztoks { get; set; }
        public DbSet<Jatek_Platform> Jatek_Platforms { get; set; }
        public DbSet<Platformok> Platformoks { get; set; }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}

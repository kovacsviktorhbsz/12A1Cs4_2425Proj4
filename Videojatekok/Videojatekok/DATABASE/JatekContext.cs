using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Videojatekok.MODELS;

namespace Videojatekok.DATABASE
{
    class JatekContext : DbContext
    {
        public DbSet<Jatekok> Jatekoks { get; set; }
    }
}

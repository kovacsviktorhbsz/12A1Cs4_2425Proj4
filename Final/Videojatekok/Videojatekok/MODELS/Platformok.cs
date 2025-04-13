using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videojatekok.MODELS
{
    internal class Platformok
    {
        [Key]
        public int Platform_id { get; set; }
        public string Nev { get; set; }
    }
}

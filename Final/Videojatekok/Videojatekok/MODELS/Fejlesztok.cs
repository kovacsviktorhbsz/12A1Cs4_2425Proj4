using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videojatekok.MODELS
{
    internal class Fejlesztok
    {
        [Key]
        public int Fejleszto_id { get; set; }
        public string Nev { get; set; }
        public string Orszag { get; set; }
        public int? Alapitas_ev { get; set; }

    }
}

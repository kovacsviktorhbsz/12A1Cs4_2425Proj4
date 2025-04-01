using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videojatekok.MODELS
{
    internal class Felhasznalok
    {
        public int Felhasznalo_id { get; set; }
        public string Felhasznalonev { get; set; }
        public string Email { get; set; }
        public int Regisztracio_datum { get; set; }
    }
}

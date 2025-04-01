using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videojatekok.MODELS
{
    internal class Ertekelesek
    {
        public int Ertekeles_id { get; set; }
        public int Felhasznalo_id { get; set; }
        public int Jatek_id { get; set; }
        public string Szoveges_velemeny { get; set; }
        public int Datum { get; set; }
        public int Like_szam {  get; set; }
    }
}

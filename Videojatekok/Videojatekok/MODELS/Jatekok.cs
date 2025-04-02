using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videojatekok.MODELS
{
    class Jatekok
    {
        public int Jatek_id { get; set; }
        public string Cim { get; set; }
        public int Kiadasi_ev { get; set; }
        public int Fejleszto_id { get; set; }
        public virtual Fejlesztok Fejlesztok { get; set; }
        public string Mufaj { get; set; }
        public int Ar { get; set; }
        public string Multiplayer { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Videojatekok.MODELS
{
    internal class Jatek_Platform
    {
        [Key]
        public int Jatek_id { get; set; }
        public virtual Jatekok Jatekok { get; set; }
        public int Platform_id { get; set; }
        public virtual Platformok Platformok { get; set; }
    }
}

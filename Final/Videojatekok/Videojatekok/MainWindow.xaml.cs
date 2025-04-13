using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Videojatekok.DATABASE;
using Videojatekok.MODELS;
using System.Data.Entity;
using MySql.Data.MySqlClient;

namespace Videojatekok
{

    public partial class MainWindow : Window
    {
        private JatekContext ctx = new JatekContext();
        public MainWindow()
        {
            InitializeComponent();
            foreach (var item in ctx.Jatekoks)
            {
                lbJatekList.Items.Add(item.Cim);
            }

        }
        private void RefreshListBox()
        {
            lbJatekList.Items.Clear();
            foreach (var item in ctx.Jatekoks)
            {
                lbJatekList.Items.Add(item.Cim);

            }

        }
        private void lbJatekList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var title = (string)lbJatekList.SelectedItem;
            var game = ctx.Jatekoks
                .Include(x => x.Fejlesztok)
                .Where(x => x.Cim == title).FirstOrDefault();
            GameToFields(game);
        }

        private void GameToFields(Jatekok jatek)
        {
            if (jatek == null)
                return;

            tbId.Text = jatek.Jatek_id.ToString();
            tbNev.Text = jatek.Cim;
            tbEv.Text = jatek.Kiadasi_ev.ToString();
            tbMufaj.Text = jatek.Mufaj;
            tbAr.Text = jatek.Ar.ToString();
            tbMultiplayer.Text = jatek.Multiplayer;
            tbFejNev.Text = jatek.Fejlesztok.Nev;
            tbFejOrszag.Text = jatek.Fejlesztok.Orszag;
            tbAlapEv.Text = jatek.Fejlesztok.Alapitas_ev.ToString();
        }
        private Jatekok FieldsToGame()
        {
            int year = 0;
            int ar = 0;
            int alapev = 0;

            try
            {
                if (!string.IsNullOrWhiteSpace(tbEv.Text))
                    year = int.Parse(tbEv.Text);
            }
            catch
            {
                MessageBox.Show("Hibás év formátum! Csak számot írj be.");
                return null;
            }

            try
            {
                if (!string.IsNullOrWhiteSpace(tbAr.Text))
                    ar = int.Parse(tbAr.Text);
            }
            catch
            {
                MessageBox.Show("Hibás ár formátum! Csak számot írj be.");
                return null;
            }

            try
            {
                if (!string.IsNullOrWhiteSpace(tbAlapEv.Text))
                    alapev = int.Parse(tbAlapEv.Text);
            }
            catch
            {
                MessageBox.Show("Hibás alapítási év formátum! Csak számot írj be.");
                return null;
            }

            var fejleszto = ctx.Fejlesztoks.Where(x => x.Nev == tbFejNev.Text)
                                        .FirstOrDefault();
            var orszag = ctx.Fejlesztoks.Where(x => x.Nev == tbFejOrszag.Text)
                                        .FirstOrDefault();
            var Alapev = ctx.Fejlesztoks.Where(x => x.Nev == tbAlapEv.Text)
                                        .FirstOrDefault();

            var jatekok = new Jatekok
            {
                Cim = tbNev.Text,
                Kiadasi_ev = year,
                Mufaj = tbMufaj.Text,
                Ar = ar,
                Multiplayer = tbMultiplayer.Text,

                Fejlesztok = new Fejlesztok
                {
                    Nev = tbFejNev.Text,
                    Orszag = tbFejOrszag.Text,
                    Alapitas_ev = alapev
                }

            };
            return jatekok;
        }
        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var game = FieldsToGame();
                game = ctx.Jatekoks.Add(game);
                ctx.SaveChanges();
                if (game != null)
                {
                    GameToFields(game);
                    RefreshListBox();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }


        private void btnRead_Click(object sender, RoutedEventArgs e)
        {
            lbJatekList.Items.Clear();
            List<Jatekok> res = new List<Jatekok>();

            if (int.TryParse(tbId.Text, out int id))
            {
                var found = ctx.Jatekoks.Include(x => x.Fejlesztok)
                                        .FirstOrDefault(x => x.Jatek_id == id);
                if (found != null)
                {
                    res.Add(found);
                }
            }
            else
            {
                var nev = tbNev.Text;
                var mufaj = tbMufaj.Text;
                var multiplayer = tbMultiplayer.Text;
                var fejleszto = tbFejNev.Text;
                var orszag = tbFejOrszag.Text;

                res = ctx.Jatekoks.Include(x => x.Fejlesztok)
                                  .Where(x => x.Cim.Contains(nev) &&
                                              x.Mufaj.Contains(mufaj) &&
                                              x.Multiplayer.Contains(multiplayer) &&
                                              x.Fejlesztok.Nev.Contains(fejleszto) &&
                                              x.Fejlesztok.Orszag.Contains(orszag)).ToList();

                if (tbEv.Text != "")
                {
                    var year = int.Parse(tbEv.Text);
                    res = res.Where(x => x.Kiadasi_ev == year).ToList();
                }

                if (tbAr.Text != "")
                {
                    var ar = int.Parse(tbAr.Text);
                    res = res.Where(x => x.Ar == ar).ToList();
                }

                if (tbAlapEv.Text != "")
                {
                    var alapev = int.Parse(tbAlapEv.Text);
                    res = res.Where(x => x.Fejlesztok.Alapitas_ev == alapev).ToList();
                }

                if (int.TryParse(tbMinAr.Text, out var min) && int.TryParse(tbMaxAr.Text, out var max))
                {
                    res = res.Where(x => x.Ar >= min && x.Ar <= max).ToList();
                }

            }

            foreach (var item in res)
                lbJatekList.Items.Add(item.Cim);

            if (res.Count > 0)
            {
                lbJatekList.SelectedIndex = 0;
                GameToFields(res[0]);
            }
            else
            {
                MessageBox.Show("Nincs találat!");
                tbId.Text = "";
                tbNev.Text = "";
                tbEv.Text = "";
                tbMufaj.Text = "";
                tbAr.Text = "";
                tbMultiplayer.Text = "";
                tbFejNev.Text = "";
                tbFejOrszag.Text = "";
                tbAlapEv.Text = "";
                RefreshListBox();
            }
        }


        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            if (!int.TryParse(tbId.Text, out var id))
            {
                MessageBox.Show("Hibás ID formátum!");
                return;
            }

            var fields = FieldsToGame();
            if (fields == null)
            {
                return;
            }

            var game = ctx.Jatekoks.Where(x => x.Jatek_id == id).FirstOrDefault();
            if (game != null)
            {
                if (fields.Cim != "")
                    game.Cim = fields.Cim;

                if (fields.Kiadasi_ev != 0)
                    game.Kiadasi_ev = fields.Kiadasi_ev;

                if (fields.Mufaj != "")
                    game.Mufaj = fields.Mufaj;

                if (fields.Ar != 0)
                    game.Ar = fields.Ar;

                if (fields.Multiplayer != "")
                    game.Multiplayer = fields.Multiplayer;

                if (fields.Fejlesztok != null)
                {
                    game.Fejlesztok.Nev = fields.Fejlesztok.Nev;
                    game.Fejlesztok.Orszag = fields.Fejlesztok.Orszag;
                    game.Fejlesztok.Alapitas_ev = fields.Fejlesztok.Alapitas_ev;
                }

                ctx.SaveChanges();
                RefreshListBox();
            }
            else
            {
                MessageBox.Show("Nincs ilyen azonosítóval játék az adatbázisban.");
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

            var id = int.Parse(tbId.Text);
            var jatek = ctx.Jatekoks.Where(x => x.Jatek_id == id).FirstOrDefault();

            if (jatek != null)
            {
                ctx.Jatekoks.Remove(jatek);
                ctx.SaveChanges();
                RefreshListBox();
            }
            else
            {
                MessageBox.Show("Nincs ilyen azonosítóval játék eltárolva!");
            }

        }

        private void btn1_Click(object sender, RoutedEventArgs e)
        {
            var atlag = ctx.Jatekoks.Average(x => x.Ar);

            MessageBox.Show($"Az átlagos ár: {atlag} Forint!");
        }

        private void btn2_Click(object sender, RoutedEventArgs e)
        {
            var minstudio = ctx.Jatekoks.Min(x => x.Fejlesztok.Alapitas_ev);

            MessageBox.Show($"A legöregebb stúdió: {minstudio} -ben alapúlt!");
        }

        private void btn3_Click(object sender, RoutedEventArgs e)
        {
            var minjatek = ctx.Jatekoks.Min(x => x.Kiadasi_ev);

            MessageBox.Show($"A legrégebbi játék: {minjatek} -ban jelent meg!");
        }

        private void btn4_Click(object sender, RoutedEventArgs e)
        {
            var usa = ctx.Jatekoks.Where(x => x.Fejlesztok.Orszag == "USA").Count();
            var japan = ctx.Jatekoks.Where(x => x.Fejlesztok.Orszag == "Japán").Count();
            var ismeretlen = ctx.Jatekoks.Where(x => x.Fejlesztok.Orszag == "Ismeretlen").Count();
            var egyeb = ctx.Jatekoks.Where(x => x.Fejlesztok.Orszag != "USA" && x.Fejlesztok.Orszag == "Japán" && x.Fejlesztok.Orszag == "Ismeretlen").Count();
            MessageBox.Show($"Az amerikai játékstúdiók száma: {usa} \nA japánoké: {japan}\nAz ismeretleneké: {ismeretlen}\nAz egyebeké: {egyeb}");
        }

        private void TextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            TextBox tb = sender as TextBox;
            if (tb.Text == "Min" || tb.Text == "Max")
            {
                tb.Text = "";
                tb.Foreground = Brushes.Black;
            }
        }

        private void TextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (tbMinAr.Text == "")
            {
                tbMinAr.Text = "Min";
                tbMinAr.Foreground = Brushes.Gray;
            }

            if (tbMaxAr.Text == "")
            {
                tbMaxAr.Text = "Max";
                tbMaxAr.Foreground = Brushes.Gray;
            }
        }

        private void btnTitok_Click(object sender, RoutedEventArgs e)
        {
            Random rand = new Random();
            int numberOfWindows = 1;

            for (int i = 0; i < numberOfWindows; i++)
            {
                var popup = new ImagePopup();

                var screenWidth = SystemParameters.PrimaryScreenWidth;
                var screenHeight = SystemParameters.PrimaryScreenHeight;

                popup.Left = rand.Next(0, (int)(screenWidth - popup.Width));
                popup.Top = rand.Next(0, (int)(screenHeight - popup.Height));

                popup.Show();

            }
        }
    }
}

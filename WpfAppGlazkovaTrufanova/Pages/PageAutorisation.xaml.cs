using Microsoft.VisualBasic.ApplicationServices;
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
using WpfAppGlazkovaTrufanova.Classes;

namespace WpfAppGlazkovaTrufanova.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageAutorisation.xaml
    /// </summary>
    public partial class PageAutorisation : Page
    {
        public PageAutorisation()
        {
            InitializeComponent();
        }

        private void btnSend_Click(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text;
            string password = psbPassword.Password;
            using (GlazkovaTrufanovaContext tradeContext = new GlazkovaTrufanovaContext())
            {
                bool flag = false;
                foreach (User user in tradeContext.Users.ToList())
                    if (user.UserLogin == login)
                        if (user.UserPassword == password)
                        {
                            MessageBox.Show("Добро пожаловать!");

                            flag = true;
                            ClassHelper.frmNavigate.Navigate(new PageProducts(user));
                        }
                if (!flag)
                {
                    MessageBox.Show("Не правильно введен логин или пароль");
                }
            }
        }
    }
}
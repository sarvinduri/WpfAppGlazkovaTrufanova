using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic.ApplicationServices;
using System;
using System.Collections;
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
    /// Логика взаимодействия для PageProducts.xaml
    /// </summary>
    public partial class PageProducts : Page
    {
        GlazkovaTrufanovaContext GTContext = new GlazkovaTrufanovaContext();
        public PageProducts()
        {
            InitializeComponent();
            txbFIO.Text = Dictionary.UserSurname + " " + Dictionary.UserName + " " + Dictionary.UserPatronymic;
            lstViewProducts.ItemsSource = GTContext.Products.Include(t => t.Order).ToList();
        }

        private void txtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            string searchLine = txtSearch.Text;
            if (!string.IsNullOrEmpty(searchLine))
            {
                lstViewProducts.ItemsSource = GTContext.Products.Include(t => t.Products).
                Where(n => n.ProductName.Contains(searchLine) ||
                n.ProductPrice.Contains(searchLine).ToList());
            }
            else
            {
                lstViewProducts.ItemsSource = GTContext.Products.Include(t => t.Products).ToList();
            }
        }

        private void rbtDown_Checked(object sender, RoutedEventArgs e)
        {
            lstViewProducts.ItemsSource = GTContext.Products.Include(t => t.Products).OrderByDescending(x => x.ProductsPrice).ToList();
        }

        private void rbtUp_Checked(object sender, RoutedEventArgs e)
        {
            GlazkovaTrufanovaContext GTContext = new GlazkovaTrufanovaContext();
            lstViewProducts.ItemsSource = GTContext.Products.Include(t => t.Products).OrderBy(x => x.ProductsPrice).ToList();
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {

        }

        private void cmbName_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            int numberProducts;

            string nameProducts = cmbName.SelectedItem.ToString();

            if (nameProducts == "Все производители")
                numberProducts = 0;
            else
                numberProducts = GTContext.Manufacturers.FirstOrDefault
                    (t => t.Name == nameProducts).ManufacturerId;
            if (numberProducts == 0)
            {
                lstViewProducts.ItemsSource = GTContext.Products.Include
                    (t => t.Products).ToList();
            }
            else
            {
                lstViewProducts.ItemsSource = GTContext.Products.Include
                    (t => t.Products).Where(x => x.IDProducts == numberProducts).ToList();
            }
        }
    }
}
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

namespace RentShop.Pages
{
    /// <summary>
    /// Логика взаимодействия для LogInPage.xaml
    /// </summary>
    public partial class LogInPage : Page
    {
        public LogInPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errers = new StringBuilder();
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    errers.AppendLine("Введите логин");
                }
                if (string.IsNullOrEmpty(PasswordTextBox.Password))
                {
                    errers.AppendLine("Введите пароль");
                }

                if(errers.Length > 0)
                {
                    MessageBox.Show(errers.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }

                if (Data.EmployeeBDEntities.GetContext().Users.Any(d => d.Login == LoginTextBox.Text && d.Password == PasswordTextBox.Password))
                {
                    Classes.Manager.MainFrame.Navigate(new Pages.ListPage());
                }


            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);


            }
        }
    }
}

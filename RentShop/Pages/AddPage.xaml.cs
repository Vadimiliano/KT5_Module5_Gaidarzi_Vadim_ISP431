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
    /// Логика взаимодействия для AddPage.xaml
    /// </summary>
    public partial class AddPage : Page
    {
        public AddPage()
        {
            InitializeComponent();
            RoleComboBox.ItemsSource = Data.EmployeeBDEntities.GetContext().Role.ToList();
            GenderComboBox.ItemsSource = Data.EmployeeBDEntities.GetContext().Gender.ToList();
        }

        private void GoBackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ListPage());
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {

            try
            {
                StringBuilder error = new StringBuilder();
                if (string.IsNullOrEmpty(FirstNameTextBox.Text))
                {
                    error.AppendLine("Введите фамилию");
                }
                if (string.IsNullOrEmpty(NameTextBox.Text))
                {
                    error.AppendLine("Введите имя");
                }
                if (string.IsNullOrEmpty(SurnameTextBox.Text))
                {
                    error.AppendLine("Введите отчество");
                }
                if (string.IsNullOrEmpty(RoleComboBox.Text))
                {
                    error.AppendLine("Выберите должность");
                }
                if (string.IsNullOrEmpty(DateOfBirthTextBox.Text))
                {
                    error.AppendLine("Введите дату рождения");
                }
                if (string.IsNullOrEmpty(PhoneNumberTextBox.Text))
                {
                    error.AppendLine("Введите телефон");
                }
                if (string.IsNullOrEmpty(GenderComboBox.Text))
                {
                    error.AppendLine("Выберите пол");
                }
                if (string.IsNullOrEmpty(EmailTextBox.Text))
                {
                    error.AppendLine("Введите email");
                }
                if (string.IsNullOrEmpty(LoginTextBox.Text))
                {
                    error.AppendLine("Введите логин");
                }
                if (string.IsNullOrEmpty(PasswordTextBox.Password))
                {
                    error.AppendLine("Введите пароль");
                }
                if (string.IsNullOrEmpty(RepeatPasswordTextBox.Password))
                {
                    error.AppendLine("Подтвердите пароль");
                }

                if(PasswordTextBox.Password != RepeatPasswordTextBox.Password)
                {
                    error.AppendLine("Пароли не совпадают");
                }

                if(error.Length > 0)
                {
                    MessageBox.Show(error.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }


                


            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);

            }

        }
    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace СервисЦентр
{
    public partial class Form3 : Form
    {
        public Form3()
        {
            InitializeComponent();
        }

        private void сотрудникBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
           

        }

        private void Form3_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "сервисЦентрDataSet1.Отдел_Кадров". При необходимости она может быть перемещена или удалена.
            this.отдел_КадровTableAdapter.Fill(this.сервисЦентрDataSet1.Отдел_Кадров);
           

            using (SqlConnection conn = new SqlConnection(СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT distinct Наименование_должности FROM Отдел_Кадров";

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    comboBox1.Items.Add(reader[0]);
                }
                conn.Close();
            }
            DataSet ds = new DataSet();
            string connect = СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString;
            SqlConnection dataBaseConnection = new SqlConnection(connect);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Наименование_должности, Код_Сотрудника, Фамилия_Сотрудника, Имя_Сотрудника, Отчество_Сотрудника, Возраст, Пол, Адрес_Проживания, Телефон_Сотрудника, Паспортные_Данные, Код_Должности, Логин, Пароль  FROM Отдел_Кадров ", dataBaseConnection);
            dataAdapter.Fill(ds, "Отдел_Кадров");
            отдел_КадровDataGridView.DataSource = ds.Tables["Отдел_Кадров"];



        }
        private void Vvod()
        {

            DataSet ds = new DataSet();
            string connect = СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString;
            SqlConnection dataBaseConnection = new SqlConnection(connect);
            string sql = "SELECT Наименование_должности, Код_Сотрудника, Фамилия_Сотрудника, Имя_Сотрудника, Отчество_Сотрудника, Возраст, Пол, Адрес_Проживания, Телефон_Сотрудника, Паспортные_Данные, Код_Должности, Логин, Пароль  FROM Отдел_Кадров ";
            string s = "";
            if (comboBox1.SelectedIndex != 0)
                s += " Where Наименование_должности = '" + comboBox1.Text + "'";

            sql += s;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, dataBaseConnection);
            dataAdapter.Fill(ds, "Отдел_Кадров");
            отдел_КадровDataGridView.DataSource = ds.Tables["Отдел_Кадров"];
        }
        private void button2_Click(object sender, EventArgs e)
        {
           
         
        }

        private void button3_Click(object sender, EventArgs e)
        {
            ГлавныйВход form = new ГлавныйВход();
            form.Show();
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Вход form = new Вход();
            form.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            
        }

        private void сотрудникBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            

        }

        private void должностьBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            

        }

        private void должностьDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void должностьBindingNavigator_RefreshItems(object sender, EventArgs e)
        {
        }

        private void должностьBindingNavigatorSaveItem_Click_1(object sender, EventArgs e)
        {
            

        }

        private void должностьBindingNavigatorSaveItem_Click_2(object sender, EventArgs e)
        {
            

        }

        private void сотрудникBindingNavigatorSaveItem_Click_2(object sender, EventArgs e)
        {
           

        }

        private void сотрудникBindingNavigatorSaveItem_Click_3(object sender, EventArgs e)
        {
           

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Vvod();
        }
    }
    
}

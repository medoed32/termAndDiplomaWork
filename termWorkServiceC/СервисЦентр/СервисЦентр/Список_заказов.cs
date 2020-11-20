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
    public partial class Список_заказов : Form
    {
        public Список_заказов()
        {
            InitializeComponent();
            
           
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ГлавныйВход form = new ГлавныйВход();
            form.Show();
            this.Hide();

        }

        private void Список_заказов_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "сервисЦентрDataSet1.Список_Заказов". При необходимости она может быть перемещена или удалена.
            this.список_ЗаказовTableAdapter.Fill(this.сервисЦентрDataSet1.Список_Заказов);
            
            
            using (SqlConnection conn = new SqlConnection(СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT Отметка_О_Гарантии FROM Список_Заказов";

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    comboBox1.Items.Add(reader[0]);
                }
                conn.Close();
            }
            using (SqlConnection conn = new SqlConnection(СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT Наименование FROM Список_Заказов";

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    comboBox2.Items.Add(reader[0]);
                }
                conn.Close();
            }
            using (SqlConnection conn = new SqlConnection(СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT Код_Вида_Неисправности FROM Список_Заказов";

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    comboBox3.Items.Add(reader[0]);
                }
                conn.Close();
            }

            DataSet ds = new DataSet();
            string connect = СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString;
            SqlConnection dataBaseConnection = new SqlConnection(connect);
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Номер_Заказа, Дата_Заказа, Дата_Возврата, Фамилия_Заказчика, Имя_Заказчика, Отчество_Заказчика, Серийный_Номер, Код_Вида_Неисправности, Методы_Ремонта, Код_Запчасти_1, Код_Запчасти_2, Код_Запчасти_3, Описание, Симптомы, Код_Магазина,Наименование, Отметка_О_Гарантии, Срок_Гарантии_Ремонта, Цена, Код_Сотрудника, Фамилия_Сотрудника  FROM Список_Заказов ", dataBaseConnection);
            dataAdapter.Fill(ds, "Список_Заказов");
            список_ЗаказовDataGridView.DataSource = ds.Tables["Список_Заказов"];

            
           
        }
        private void Vvod()
        {

            DataSet ds = new DataSet();
            string connect = СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString;
            SqlConnection dataBaseConnection = new SqlConnection(connect);
            string sql = "SELECT Номер_Заказа, Дата_Заказа, Дата_Возврата, Фамилия_Заказчика, Имя_Заказчика, Отчество_Заказчика, Серийный_Номер, Код_Вида_Неисправности, Методы_Ремонта, Код_Запчасти_1, Код_Запчасти_2, Код_Запчасти_3, Описание, Симптомы, Код_Магазина, Наименование, Отметка_О_Гарантии, Срок_Гарантии_Ремонта, Цена, Код_Сотрудника, Фамилия_Сотрудника  FROM Список_Заказов ";
            string s = "";
            if (comboBox1.SelectedIndex != 0)
                s += " Where Отметка_О_Гарантии = '" + comboBox1.Text + "'";
            else if (comboBox2.SelectedIndex != 0)
                s += " Where Наименование = '" + comboBox2.Text + "'";
            else if (comboBox3.SelectedIndex != 0)
                s += " Where Код_Вида_Неисправности = '" + comboBox3.Text + "'";

            sql += s;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, dataBaseConnection);
            dataAdapter.Fill(ds, "Список_Заказов");
            список_ЗаказовDataGridView.DataSource = ds.Tables["Список_Заказов"];
        }
        private void обсуживаемый_МагазинBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
           

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void tabPage2_Click(object sender, EventArgs e)
        {

        }

        private void fillByToolStripButton_Click(object sender, EventArgs e)
        {
            try
            {
             
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void fillByToolStripButton1_Click(object sender, EventArgs e)
        {
            try
            {
                
            }
            catch (System.Exception ex)
            {
                System.Windows.Forms.MessageBox.Show(ex.Message);
            }

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Вход form = new Вход();
            form.Show();
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Список_заказов form = new Список_заказов();
            form.Show();
            this.Hide();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Vvod();
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Vvod();
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Vvod();
        }
    }
}

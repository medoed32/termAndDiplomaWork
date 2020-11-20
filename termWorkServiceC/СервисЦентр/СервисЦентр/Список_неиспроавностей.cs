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
    public partial class Список_неиспроавностей : Form
    {
        public Список_неиспроавностей()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ГлавныйВход form = new ГлавныйВход();
            form.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Вход form = new Вход();
            form.Show();
            this.Hide();
        }

        private void Список_неиспроавностей_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "сервисЦентрDataSet1.Список_Неисправностей". При необходимости она может быть перемещена или удалена.
            this.список_НеисправностейTableAdapter.Fill(this.сервисЦентрDataSet1.Список_Неисправностей);
            using (SqlConnection conn = new SqlConnection(СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString))
            {
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "SELECT Наименование_Модели FROM Список_Неисправностей";

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
                cmd.CommandText = "SELECT Тип_Модели FROM Список_Неисправностей";

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
                cmd.CommandText = "SELECT Производитель FROM Список_Неисправностей";

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
            SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT Код_Вида_Неисправности,Код_модели, Наименование_Модели, Тип_Модели, Производитель, Описание, Симптомы, Методы_Ремонта, Код_Запчасти_1, Код_Запчасти_2, Код_Запчасти_3, Цена  FROM Список_Неисправностей ", dataBaseConnection);
            dataAdapter.Fill(ds, "Список_Неисправностей");
            список_НеисправностейDataGridView.DataSource = ds.Tables["Список_Неисправностей"];



        }
        private void Vvod()
        {

            DataSet ds = new DataSet();
            string connect = СервисЦентр.Properties.Settings.Default.СервисЦентрConnectionString;
            SqlConnection dataBaseConnection = new SqlConnection(connect);
            string sql = "SELECT Код_Вида_Неисправности,Код_модели, Наименование_Модели, Тип_Модели, Производитель, Описание, Симптомы, Методы_Ремонта, Код_Запчасти_1, Код_Запчасти_2, Код_Запчасти_3, Цена  FROM Список_Неисправностей";
            string s = "";
            if (comboBox1.SelectedIndex != 0)
                s += " Where Наименование_Модели = '" + comboBox1.Text + "'";
            else if (comboBox2.SelectedIndex != 0)
                s += " Where Тип_Модели = '" + comboBox2.Text + "'";
            else if (comboBox3.SelectedIndex != 0)
                s += " Where Производитель = '" + comboBox3.Text + "'";

            sql += s;

            SqlDataAdapter dataAdapter = new SqlDataAdapter(sql, dataBaseConnection);
            dataAdapter.Fill(ds, "Список_Неисправностей");
            список_НеисправностейDataGridView.DataSource = ds.Tables["Список_Неисправностей"];
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Vvod();
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

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
    public partial class Вход : Form
    {
        public static int role1;
        public Вход()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(textBox1.Text) || String.IsNullOrEmpty(textBox2.Text))
            {
                MessageBox.Show("Данные не введены");
            }
            else
            {
                string sql = @"Data Source=.\sqlexpress;Initial Catalog=СервисЦентр;Integrated Security=True";

                SqlConnection con = new SqlConnection(sql);
                try
                {
                    con.Open();
                    string s = "Select * from [Сотрудник] where Логин='" + textBox1.Text + "' and Пароль='" + textBox2.Text + "'";
                    SqlCommand com = new SqlCommand(s, con);
                    SqlDataReader dr = com.ExecuteReader();
                    string name;
                    int role;
                    if (dr.HasRows)
                    {
                        dr.Read();
                        name = (string)dr["Имя_сотрудника"];
                        role = (int)dr["Код_должности"];
                        role1 = role;

                        ГлавныйВход form = new ГлавныйВход();

                        form.Show();
                        this.Hide();



                    }
                    else
                    {
                        MessageBox.Show("Недействительный логин или пароль!");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("СЕРВЕР УПАЛ, ЧЕЛ", ex.Message);
                }
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void Вход_Load(object sender, EventArgs e)
        {

        }
    }
}

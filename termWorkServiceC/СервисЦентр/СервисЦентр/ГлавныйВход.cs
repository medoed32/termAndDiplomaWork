using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace СервисЦентр
{
    public partial class ГлавныйВход : Form
    {
        public ГлавныйВход()
        {
            InitializeComponent();
            if (Вход.role1 == 2)
            {
                button1.Hide();
            }
            if (Вход.role1 == 3)
            {
                button3.Hide();
                button5.Hide();
            }

        }
        
        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Администратор_Load(object sender, EventArgs e)
        {
            

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void должностьDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button3_Click_1(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            Список_заказов form = new Список_заказов();
            form.Show();
            this.Hide();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Список_неиспроавностей form = new Список_неиспроавностей();
            form.Show();
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Form3 form = new Form3();
            form.Show();
            this.Hide();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Вход form = new Вход();
            form.Show();
            this.Hide();
        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {

        }
    }
}

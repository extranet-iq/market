using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace MarketManagmentSystem
{
    public partial class Form1 : Form
    {
        Form openedForm;
        public Form1()
        {
            InitializeComponent();
        }
        int panelWindth;
        private void bunifuImageButton1_Click(object sender, EventArgs e)
        {
            if(panel3.Width>=221)
            {
                panelWindth = panel3.Width;
                for(int i=panelWindth;i>=45;i-=7)
                {
                    panel3.Width = i;
                  
                }
                panel3.Width = 45;
               // bunifuImageButton1.Image = Properties.Resources.openpanel;
            }
            else
            {
                for (int i = 45; i <= panelWindth; i+=7)
                {
                    panel3.Width = i;
                    
                    //Thread.Sleep(2);
                    bunifuFlatButton1.Width = i;
                  
                }

               
                // bunifuImageButton1.Image = Properties.Resources.closepanel;
              
            }
           
                //openedForm.WindowState = FormWindowState.Maximized;
             // panelDitail.Refresh();
        }

        private void bunifuFlatButton1_Click(object sender, EventArgs e)
        {
           
            openedForm = new Sell();
            showFormInPanel(panelDitail, openedForm);
        }
        void showFormInPanel(Panel panel, Form form)
        {
            panel.Controls.Clear();
            form.TopLevel = false;
            panel.Controls.Add(form);
            form.Dock = DockStyle.Fill;
            form.Show();
        }

        private void bunifuFlatButton1_Paint(object sender, PaintEventArgs e)
        {
        }

        private void bunifuImageButton3_Click(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Maximized)
                WindowState = FormWindowState.Normal;
            else WindowState = FormWindowState.Maximized;
        }

        private void bunifuImageButton4_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void bunifuImageButton2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}

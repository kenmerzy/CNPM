using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ComponentFactory.Krypton.Toolkit;

namespace GUI
{
    public partial class usrctrCauHoi : UserControl
    {
        public usrctrCauHoi()
        {
            InitializeComponent();
        }
        public usrctrCauHoi(string cauHoi, int stt, string dapAn1, string dapAn2, string dapAn3, string dapAn4)
        {
            InitializeComponent();
            label1.Text = "Câu " + stt + ": " + cauHoi;
            rdBtnDapAn1.Text = dapAn1;
            rdBtnDapAn2.Text = dapAn2;
            rdBtnDapAn3.Text = dapAn3;
            rdBtnDapAn4.Text = dapAn4;
        }


        public void setTagDapAn(string dapAn1, string dapAn2, string dapAn3, string dapAn4)
        {
            rdBtnDapAn1.Tag = dapAn1;
            rdBtnDapAn2.Tag = dapAn2;
            rdBtnDapAn3.Tag = dapAn3;
            rdBtnDapAn4.Tag = dapAn4;
        }
        public void toMau(string noiDungDA)
        {
            foreach (KryptonRadioButton rd in tableLayoutPanel2.Controls)
            {
               
                if (rd.Checked)
                {
                    rd.StateNormal.ShortText.Color1 = Color.Red;                                       
                }
                //Sai tô đỏ
                // Đún tô xanh
                if (rd.Tag.Equals("True"))
                {
                    rd.StateNormal.ShortText.Color1 = Color.LimeGreen;
                }

                rd.AutoCheck = false;
            }
        }
        public bool checkAnswer()
        {
             foreach (KryptonRadioButton rd in tableLayoutPanel2.Controls)
            {
                 if (rd.Checked && rd.Tag.Equals("True"))
                 {
                     return true;
                 }
            }
            return false;
        }

    }
}

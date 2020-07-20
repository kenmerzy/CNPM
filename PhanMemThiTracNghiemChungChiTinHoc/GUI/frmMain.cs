using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
namespace GUI
{
    public partial class frmMain : Form
    {
        CauHoiBLL_DAL cauHoiBLL_DAL;
        List<CauHoi> cauHoiHienThi;
        int minute = 20;
        int second = 0;
        public frmMain()
        {
            InitializeComponent();
            cauHoiBLL_DAL = new CauHoiBLL_DAL();
         }

        private void frmMain_Load(object sender, EventArgs e)
        {
            //tabThi.Dispose();
            lblNgayThi.Text = DateTime.Now.ToShortDateString();
        }
        private void setMatKhau()
        {
            string[] mk = dtpkNgaySinh.Value.ToShortDateString().Split('/');
            string ngay = mk[1];
            string thang = mk[0];
            string nam = mk[2];

            if (mk[1].Length < 2)
                ngay = "0" + mk[1];
            if (mk[0].Length < 2)
                thang = "0" + mk[0];
            string kq = ngay + thang + nam;
            txtMatKhau.Text = kq;
        }
        private void dtpkNgaySinh_ValueChanged(object sender, EventArgs e)
        {
            setMatKhau();
        }
        private List<int> randomCauHoi(List<CauHoi> lstCauHoi,int soluongCauHoi)
        {
            Random r = new Random();
            List<int> dsch = new List<int>();
            for (int i = 0; i < soluongCauHoi; i++)
               dsch.Add( r.Next(0, lstCauHoi.Count));
            return dsch;
        }
        private void kryptonButton2_Click(object sender, EventArgs e)
        {
            int stt;

            List<CauHoi> lstCH = cauHoiBLL_DAL. getCauHoi();

            List<int> dsch =  randomCauHoi(lstCH,20);

            for (int i = 0; i < 20; i++)
            {
                stt = dsch[i];

                List<DapAn> lstDA = cauHoiBLL_DAL.getDapan(lstCH[stt].MaCH);
                usrctrCauHoi ch = new usrctrCauHoi(lstCH[stt].NoiDungCH, i + 1, lstDA[0].NoiDungDA, lstDA[1].NoiDungDA, lstDA[2].NoiDungDA, lstDA[3].NoiDungDA);
                
                ch.setTagDapAn(lstDA[0].DungSai.ToString(), lstDA[1].DungSai.ToString(), lstDA[2].DungSai.ToString(), lstDA[3].DungSai.ToString());
               // Đáp án đúng Tag = True - Đáp án sai Tag = False;
                
                flowLayoutPanel1.Controls.Add(ch);
                flowLayoutPanel1.SetFlowBreak(ch, true);
            }
        }
        public void setThoiGianDemNguoc(int minute, int second)
        {
            this.minute = minute;
            this.second = second;
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            string mn, sc;
            second--;
            if (second < 0)
            {
                minute--;
                second = 59;
            }
            if (minute < 0)
                timer1.Enabled = false;
            if (minute < 10)
                mn = "0" + minute.ToString();
            else
                mn = minute.ToString();
            if (second < 10)
                sc = "0" + second.ToString();
            else
                sc = second.ToString();
            if(minute < 5)
                this.lblThoiGianConLai.StateNormal.ShortText.Color1 = System.Drawing.Color.Red;

            lblThoiGianConLai.Text = mn + ":" + sc;
        }

        private void btnNopBai_Click(object sender, EventArgs e)
        {
            timer1.Enabled = false;
        }





    }
}

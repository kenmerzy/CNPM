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
        const int soLuongCauHoi = 20;
        CauHoiBLL_DAL cauHoiBLL_DAL;

        List<DapAn> listDapAnDung;
        List<CauHoi> lstCH;
        List<usrctrCauHoi> listUserControl;
        List<int> dsch;
        usrctrCauHoi ch;

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
            loadCboDotThi();
            loadCboLTK();
            btnNopBai.Visible = false;
            lblTitleDiem.Visible = false;
            lblDiem.Visible = false;


        }
        public void setMatKhau()
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
            int diemSo = chamDiem();
            lblDiem.Text = diemSo.ToString() + "/"+ soLuongCauHoi.ToString();
            lblTitleDiem.Visible = true;
            lblDiem.Visible = true;
            btnNopBai.Enabled = false;

        }

        // Lâm bổ sung

        //nhập số sẽ thông báo sai
        private void txtHoTen_KeyPress(object sender, KeyPressEventArgs e)
        {
                foreach (char c in txtHoTen.Text)
                {
                    if (char.IsDigit(e.KeyChar))
                    {
                        lblHoTen.Text = "Họ tên không được nhập số";
                        e.Handled = true;
                    }
                    else
                    {
                        e.Handled = false;
                        lblHoTen.Text = "";
                    }
                }
                
        }

        //nhập chữ hoặc khoảng trắng sẽ thông báo sai
        private void txtCMND_KeyPress(object sender, KeyPressEventArgs e)
        {
            foreach (char c in txtCMND.Text)
            {
                if (char.IsLetter(e.KeyChar) || char.IsWhiteSpace(e.KeyChar) || char.IsSymbol(c))
                {
                    lblcmnd.Text = "CMND không được nhập chữ và khoảng trắng";
                    e.Handled = true;
                }
                else 
                {
                    if (txtCMND.TextLength > 12 || txtCMND.TextLength < 12)
                    {
                        e.Handled = false;
                        lblcmnd.Text = "CMND gồm 12 chữ số";
                    }
                    else
                    {
                        e.Handled = false;
                        lblcmnd.Text = "";
                    }
                
                }
               
            }
        }

        //định dạng theo email
        private void txtEmail_TextChanged(object sender, EventArgs e)
        {

            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains(".com"))
            {
                lblemail.Text = "Email sai định dạng VD: abc@gmail.com";
            }
            else if (!string.IsNullOrEmpty(txtEmail.Text))
            {
                foreach (Char c in txtEmail.Text)
                {
                    if (char.IsWhiteSpace(c))
                    {
                        lblemail.Text = "Email không được chứa khoảng trắng";
                    }
                    else
                        lblemail.Text = "";
                }
            }
            else
                lblemail.Text = "";
           
               
        }
        //nhập chữ hoặc khoảng trắng sẽ thông báo sai
        private void txtSDT_KeyPress(object sender, KeyPressEventArgs e)
        {
            foreach (char c in txtSDT.Text)
            {
                if (char.IsLetter(e.KeyChar) || char.IsWhiteSpace(e.KeyChar))
                {
                    lblsdt.Text = "SDT không được nhập chữ và khoảng trắng";
                    e.Handled = true;
                }
                else
                {
                    if (txtSDT.TextLength > 10 || txtSDT.TextLength < 10)
                    {
                        e.Handled = false;
                        lblsdt.Text = "SĐT gồm 10 chữ số";
                    }
                    else
                    {
                        e.Handled = false;
                        lblsdt.Text = "";
                    }

                }

            }
        }
        //load loại tài khoản
        public void loadCboLTK()
        {
            cboLoaiTK.DataSource = cauHoiBLL_DAL.loadLoaiTK();
            
            cboLoaiTK.DisplayMember = "LoaiTK";
            cboLoaiTK.ValueMember = "MaLoaiTK";

        }
        //load đợt thi
        public void loadCboDotThi()
        {
            cboDotThi.DataSource = cauHoiBLL_DAL.loaddotThi();
            cboDotThi.DisplayMember = "NgayThi";
            cboDotThi.ValueMember = "MaNgayThi";
        }
        //đăng ký
        private void btnDangKy_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtHoTen.Text))
                {
                    MessageBox.Show("Họ tên không được bỏ trống");
                    txtHoTen.Focus();
                }
                else if (string.IsNullOrEmpty(txtCMND.Text))
                {
                    MessageBox.Show("CMND không được bỏ trống");
                    txtCMND.Focus();
                }
                else if (dtpkNgaySinh.Checked == false)
                {
                    MessageBox.Show("Vui lòng chọn ngày sinh");
                    dtpkNgaySinh.Focus();
                }
                else if (string.IsNullOrEmpty(txtEmail.Text))
                {
                    MessageBox.Show("Email không được bỏ trống");
                    txtEmail.Focus();
                }
                else if (string.IsNullOrEmpty(txtSDT.Text))
                {
                    MessageBox.Show("SĐT không được bỏ trống");
                    txtSDT.Focus();
                }
                else
                {
                    string ngay = dtpkNgaySinh.Value.ToString("MM/dd/yyyy");

                    if (cauHoiBLL_DAL.saveDangKy(txtHoTen.Text,txtEmail.Text,txtSDT.Text,txtCMND.Text,txtMatKhau.Text,DateTime.Parse(ngay),cboLoaiTK.SelectedValue.ToString(),cboDotThi.SelectedValue.ToString()) == 1)
                    {
                        MessageBox.Show("Lưu thành công");
                        frmDangNhap frmDN = new frmDangNhap();
                        frmDN.ShowDialog();
                        
                        frmMain.ActiveForm.Close();
                    }
                    else
                    {
                        MessageBox.Show("Fail toàn tập rồi :(( ");
                    }
                }

            }
            catch { }
        }

        private void btnLamBaiThi_Click(object sender, EventArgs e)
        {
            int stt;

            lstCH = cauHoiBLL_DAL.getCauHoi();

            dsch = randomCauHoi(lstCH, soLuongCauHoi);

            listUserControl = new List<usrctrCauHoi>();

            listDapAnDung = new List<DapAn>();

            for (int i = 0; i < soLuongCauHoi; i++)
            {
                stt = dsch[i];

               
                List<DapAn> lstDA = cauHoiBLL_DAL.getDapan(lstCH[stt].MaCH);

                DapAn dadung = cauHoiBLL_DAL.getDapAnDung(lstCH[stt].MaCH);

                listDapAnDung.Add(dadung);

                ch = new usrctrCauHoi(lstCH[stt].NoiDungCH, i + 1, lstDA[0].NoiDungDA, lstDA[1].NoiDungDA, lstDA[2].NoiDungDA, lstDA[3].NoiDungDA);

                ch.setTagDapAn(lstDA[0].DungSai.ToString(), lstDA[1].DungSai.ToString(), lstDA[2].DungSai.ToString(), lstDA[3].DungSai.ToString());
                // Đáp án đúng Tag = True - Đáp án sai Tag = False;

                flowLayoutPanel1.Controls.Add(ch);
                flowLayoutPanel1.SetFlowBreak(ch, true);

                

                listUserControl.Add(ch); // kiểm soát 20 câu hỏi và đáp án
                
            }
            timer1.Enabled = true;
            btnLamBaiThi.Visible = false;
            btnNopBai.Visible = true;
        }
        private int chamDiem()
        {
            int diem = 0;
            for (int i = 0; i < soLuongCauHoi; i++)
            {
                if (listUserControl[i].checkAnswer())
                    diem++;
                listUserControl[i].toMau(listDapAnDung[i].NoiDungDA);
            }
            return diem;
        }
    }
}

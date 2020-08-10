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
        int maThiSinh;
        bool isThem;
        string maLoaiTaiKhoan;
        string maKyThi;
        bool isNhanVien;
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
        public frmMain(string maLoaiTaiKhoan,int maThiSinh,string maKyThi)
        {
            InitializeComponent();
            cauHoiBLL_DAL = new CauHoiBLL_DAL();
            this.maLoaiTaiKhoan = maLoaiTaiKhoan;
            this.maThiSinh = maThiSinh;
            this.maKyThi = maKyThi;
            if (maLoaiTaiKhoan.Equals("AD"))
            {
                tabThi.Dispose();
                tabQuanLyThiSinh.Text = "Quản lý nhân viên & thí sinh";

                isNhanVien = false;
            }
            if (maLoaiTaiKhoan.Equals("NV"))
            {
                tabThi.Dispose();
                isNhanVien = true;
                tabQuanLyCauHoi.Dispose();
            }
            if (maLoaiTaiKhoan.Equals("TS"))
            {
                tabDangKyTaiKhoan.Dispose();
                tabQuanLyCauHoi.Dispose();
                tabQuanLyThiSinh.Dispose();
            }

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
            loadCH();
            loadcontrol(false); 
            KyThi kt = cauHoiBLL_DAL.getThoiGianLamBai(maKyThi);
            if(maLoaiTaiKhoan.Equals("TS"))
                lblThoiGianConLai.Text = kt.ThoiGianLamBai.ToString() + ":00";
            if (isNhanVien)
                loadThongTinCaNhan("TS");
            else
                loadThongTinCaNhan();

        }
        private void setCboLoaiTK()
        {
            if (isNhanVien)
            {
                cboLoaiTK.SelectedIndex = 2;
                cboLoaiTK.DroppedDown = false;
            }
        }
        private void loadcontrol(bool p)
        {
            txt_CH.Enabled = txt_DA1.Enabled = txt_DA2.Enabled = txt_DA3.Enabled = txt_DA4.Enabled = txt_DoKho.Enabled = radioButton1.Enabled = radioButton2.Enabled = radioButton3.Enabled = radioButton4.Enabled = p;

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
            btnNopBai.Visible = false;

            if (cauHoiBLL_DAL.saveKetQua(maThiSinh, maKyThi, diemSo))
                MessageBox.Show("Nộp bài thi thành công");
            else
                MessageBox.Show("Thí sinh này đã làm bài thi ở kỳ này");
            
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
            if (isNhanVien)
            {
                cboLoaiTK.DataSource = cauHoiBLL_DAL.loadLoaiTK("TS");
                cboLoaiTK.DisplayMember = "LoaiTK";
                cboLoaiTK.ValueMember = "MaLoaiTK";
            }
            else
            {
                cboLoaiTK.DataSource = cauHoiBLL_DAL.loadLoaiTK();
                cboLoaiTK.DisplayMember = "LoaiTK";
                cboLoaiTK.ValueMember = "MaLoaiTK";
            }

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
                    string kyThi;
                    string ngay = dtpkNgaySinh.Value.ToString("MM/dd/yyyy");
                    if (cboLoaiTK.SelectedValue.ToString().Equals("TS"))
                        kyThi = cboChonKyThi.SelectedValue.ToString();
                    else
                        kyThi = null;

                    if (cauHoiBLL_DAL.saveDangKy(txtHoTen.Text,txtEmail.Text,txtSDT.Text,txtCMND.Text,txtMatKhau.Text,DateTime.Parse(ngay),cboLoaiTK.SelectedValue.ToString(),kyThi) == 1)
                    {
                        MessageBox.Show("Lưu thành công");                     
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
            KyThi kt = cauHoiBLL_DAL.getThoiGianLamBai(maKyThi);
            setThoiGianDemNguoc(int.Parse(kt.ThoiGianLamBai.ToString()), 0);
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
        private void loadCH()
        {
            kryptonDataGridView1.DataSource = cauHoiBLL_DAL.getCauHoi2();
        }

        public void loadThongTinCaNhan()
        {
            dgvThiSinh.DataSource = cauHoiBLL_DAL.getThiSinh();
        }
        public void loadThongTinCaNhan(string loaiTK)
        {
            dgvThiSinh.DataSource = cauHoiBLL_DAL.getThiSinh(loaiTK);
        }
        private void dgvThiSinh_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow row = dgvThiSinh.Rows[e.RowIndex];
                txtHoVaTen.Text = row.Cells[1].Value.ToString();
                txt_Email.Text = row.Cells[2].Value.ToString();
                txtCMNDan.Text = row.Cells[3].Value.ToString();
                txtMK.Text = row.Cells[4].Value.ToString();
                txtNgaysinh.Text = DateTime.Parse(row.Cells[5].Value.ToString()).ToShortDateString();
                txt_SDT.Text = row.Cells[6].Value.ToString();
            }
        }

        private void btnXoaThiSinh_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có chắc chắn xóa", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (rs == DialogResult.Yes)
            {

                string ma = dgvThiSinh.CurrentRow.Cells[0].Value.ToString();
                bool kq = cauHoiBLL_DAL.xoaThiSinh(ma);
                if (kq)
                {
                    loadThongTinCaNhan();
                    MessageBox.Show("Xóa Thành Công");
                }
                else
                {
                    MessageBox.Show("Xóa thất bại");
                }
            }
        }

        private void btnSuaThiSinh_Click(object sender, EventArgs e)
        {
            DialogResult rs = MessageBox.Show("Bạn có muốn sửa", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (rs == DialogResult.Yes)
            {
                string ma = dgvThiSinh.CurrentRow.Cells[0].Value.ToString();
                bool kq = cauHoiBLL_DAL.suaThiSinh(int.Parse(ma), txtHoVaTen.Text, txt_Email.Text, txt_SDT.Text, txtCMNDan.Text, txtMK.Text, txtNgaysinh.Text);

                if (kq)
                {
                    MessageBox.Show("Sửa Thành Công");
                    loadThongTinCaNhan();

                }
                else
                {
                    MessageBox.Show("Sửa thất bại");
                }
            }
        }

        private void cboDotThi_SelectedIndexChanged(object sender, EventArgs e)
        {
            string dotthi = cboDotThi.SelectedValue.ToString();
            cboChonKyThi.DataSource = cauHoiBLL_DAL.loadKyThi(dotthi);
            cboChonKyThi.DisplayMember = "DotThi";
            cboChonKyThi.ValueMember = "MaKT";
        }

        private void cboLoaiTK_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cboLoaiTK.SelectedValue.ToString().Equals("TS"))
            {
                cboDotThi.Visible = false;
                cboChonKyThi.Visible = false;
                lblDotThi.Visible = false;
                lblKyThi.Visible = false;
            }
            else
            {
                cboDotThi.Visible = true;
                cboChonKyThi.Visible = true;
                lblDotThi.Visible = true;
                lblKyThi.Visible = true;
            }

        }


        private void kryptonDataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txt_CH.Text = kryptonDataGridView1.SelectedCells[1].Value.ToString();
            txt_DoKho.Text = kryptonDataGridView1.SelectedCells[2].Value.ToString();
            int maCH = int.Parse(kryptonDataGridView1.SelectedCells[0].Value.ToString());
            List<DapAn> da = cauHoiBLL_DAL.getDapan(maCH);
            txt_DA1.Text = da[0].NoiDungDA;
            txt_DA2.Text = da[1].NoiDungDA;
            txt_DA3.Text = da[2].NoiDungDA;
            txt_DA4.Text = da[3].NoiDungDA;
            radioButton1.Checked = bool.Parse(da[0].DungSai.ToString());
            radioButton2.Checked = bool.Parse(da[1].DungSai.ToString());
            radioButton3.Checked = bool.Parse(da[2].DungSai.ToString());
            radioButton4.Checked = bool.Parse(da[3].DungSai.ToString());
            Btn_Xoa.Enabled = true;
            btnSuaThiSinh .Enabled= true;
        }

        private void Btn_Them_Click(object sender, EventArgs e)
        {
            Btn_Luu.Enabled = true;
            txt_CH.Clear();
            txt_DA1.Clear();
            txt_DA2.Clear();
            txt_DA3.Clear();
            txt_DA4.Clear();
            txt_DoKho.Clear();
            txt_CH.Focus();
            Btn_Sua.Enabled = false;
            Btn_Xoa.Enabled = false;
            loadcontrol(true);
            isThem = true;
        }

        private void Btn_Xoa_Click(object sender, EventArgs e)
        {
            DialogResult rs;
               rs = MessageBox.Show("Bạn có thật sự muốn xóa?", "Thông báo", MessageBoxButtons.YesNo,MessageBoxIcon.Question);
               if (rs == DialogResult.Yes)
               {
                   int maCH = int.Parse(kryptonDataGridView1.CurrentRow.Cells[0].Value.ToString());
                   if(cauHoiBLL_DAL.xoaCauHoi(maCH))
                       MessageBox.Show("Xóa thành công !!!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                   kryptonDataGridView1.DataSource = cauHoiBLL_DAL.getCauHoi2();
               }
        }

        private void Btn_Luu_Click(object sender, EventArgs e)
        {
            if (isThem)
            {
                if (txt_CH.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nội dung câu hỏi", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_CH.Focus();
                    return;
                }
                if (txt_DA1.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nội dung đáp án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_DA1.Focus();
                    return;
                }
                if (txt_DA2.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nội dung đáp án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_DA2.Focus();
                    return;
                }
                if (txt_DA3.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nội dung đáp án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_DA3.Focus();
                    return;
                }
                if (txt_DA4.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nội dung đáp án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_DA4.Focus();
                    return;
                }
                if (txt_DoKho.Text.Trim().Length == 0)
                {
                    MessageBox.Show("Bạn phải nhập nội dung đáp án", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txt_DoKho.Focus();
                    return;
                }
                List<DapAn> listDapAnThem = new List<DapAn>();

                DapAn da1, da2, da3, da4;
                da1 = new DapAn();
                da2 = new DapAn();
                da3 = new DapAn();
                da4 = new DapAn();

                da1.NoiDungDA = txt_DA1.Text;
                da1.DungSai = radioButton1.Checked;

                da2.NoiDungDA = txt_DA2.Text;
                da2.DungSai = radioButton2.Checked;

                da3.NoiDungDA = txt_DA3.Text;
                da3.DungSai = radioButton3.Checked;

                da4.NoiDungDA = txt_DA4.Text;
                da4.DungSai = radioButton4.Checked;

                listDapAnThem.Add(da1);
                listDapAnThem.Add(da2);
                listDapAnThem.Add(da3);
                listDapAnThem.Add(da4);

                if(cauHoiBLL_DAL.themCauHoi(txt_CH.Text,int.Parse(txt_DoKho.Text),listDapAnThem))
                    MessageBox.Show("Thêm thành công");
                else
                    MessageBox.Show("Thêm thất bại");
                kryptonDataGridView1.DataSource = cauHoiBLL_DAL.getCauHoi2();
                Btn_Luu.Enabled = false;
                loadcontrol(false);
            }
        }






    }
}
                                                                                                                                                                                                                                                                                                                                                                                                
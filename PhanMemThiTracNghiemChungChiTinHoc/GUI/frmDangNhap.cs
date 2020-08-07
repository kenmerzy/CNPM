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
    public partial class frmDangNhap : Form
    {
        CauHoiBLL_DAL phanQuyen;
        string maLoaiTK;
        public frmDangNhap()
        {
            InitializeComponent();
            phanQuyen = new CauHoiBLL_DAL();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }


        public bool kiemTraDangNhap()
        {
            List<ThongTinCaNhan> ttcn = phanQuyen.getThongTinCaNhan();
            string tendn = txtUsername.Text;
            string mk = txtPassword.Text;
            ThongTinCaNhan tt = null;
            foreach (ThongTinCaNhan thongtin in ttcn)
            {
                if (thongtin.SDT.Equals(tendn))
                {
                    tt = new ThongTinCaNhan();
                    tt = thongtin;
                    break;
                }
            }
            if (tt == null)
            {
                MessageBox.Show("Tên đăng nhập không tồn tại.");
                return false;
            }
            else
            {
                if (tt.MatKhau.Equals(mk))
                {
                    maLoaiTK = tt.MaLoaiTK;
                    return true;
                }
                else
                {
                    MessageBox.Show("Mật khẩu không đúng.");
                    return false;
                }
            }

        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            List<ThongTinCaNhan> ttcn = phanQuyen.getThongTinCaNhan();
            if (string.IsNullOrEmpty(txtUsername.Text) || string.IsNullOrEmpty(txtPassword.Text))
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin đăng nhập");
            else if (!kiemTraDangNhap())
            {
                return;
            }
            else
            {
                frmMain mainAD = new frmMain(maLoaiTK);
                mainAD.Show();
                this.Hide();
            }
        }

        private void txtUsername_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnDangNhap_Click(null, new EventArgs());
            }
        }


    }
}

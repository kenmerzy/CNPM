using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class CauHoiBLL_DAL
    {
        TNTHDataContext tnth = new TNTHDataContext();
        public CauHoiBLL_DAL()
        {
        }
        public List<CauHoi> getCauHoi()
        {
            var cauhois = from ch in tnth.CauHois select ch;
            List<CauHoi> asList = cauhois.ToList<CauHoi>();
            return asList;
        }
        public List<DapAn> getDapan(int mach)
        {
            var dapans = from da in tnth.DapAns where da.MaCH == mach select da;
            List<DapAn> daList = dapans.ToList<DapAn>();
            return daList;
        }
        public DapAn getDapAnDung(int mach)
        {
                         DapAn dapans = tnth.DapAns.Where(t => t.MaCH == mach && t.DungSai == true).FirstOrDefault();
                           return dapans;
        }

        // Lâm edited
        public IQueryable loadLoaiTK()
        {
            var loaitk = from tk in tnth.PhanQuyens select tk;
            return loaitk;
        }
        public IQueryable loaddotThi()
        {
            var loaidt = from d in tnth.DotThis select d;
            return loaidt;
        }

        public int saveDangKy(string hovaten,string email,string sdt,string cmnd, string mk,DateTime ngaysinh,string maloaiTK, string maNgayThi)
        {
            ThongTinCaNhan tt = new ThongTinCaNhan();
          
            tt.HoVaTenTS = hovaten;
            tt.Email = email;
            tt.NgaySinh = ngaysinh;
            tt.SDT = sdt;
            tt.CMND = cmnd;
            tt.MatKhau = mk;
            tt.MaLoaiTK = maloaiTK;
            tt.MaNgayThi = maNgayThi;
           

            try
            {
                tnth.ThongTinCaNhans.InsertOnSubmit(tt);
               
                tnth.SubmitChanges();
                return 1;
            }
            catch { }
            return 0; 


        }

        public IQueryable getThiSinh()
        {
            var thongtincanhans = from ts in tnth.ThongTinCaNhans
                                  //join i in tnth.DotThis on ts.MaNgayThi equals i.MaNgayThi
                                  //join qp in tnth.PhanQuyens on ts.MaLoaiTK equals qp.MaLoaiTK
                                  select new { ts.MaTS, ts.HoVaTenTS, ts.Email, ts.CMND, ts.MatKhau, ts.NgaySinh, ts.SDT };
            return thongtincanhans;
        }
        public bool suaThiSinh(int ma,string hoTen,string email,string sdt,string cmnd,string matkhau, string ngaysinh )
        {
            ThongTinCaNhan tt = tnth.ThongTinCaNhans.Where(t => t.MaTS == ma).FirstOrDefault();
            tt.HoVaTenTS = hoTen;
            tt.Email = email;
            tt.SDT = sdt;
            tt.CMND = cmnd;
            tt.MatKhau = matkhau;
            tt.NgaySinh = DateTime.Parse(ngaysinh);
            try
            {
                tnth.SubmitChanges();
                return true;
            }
            catch { return false; }
        }
        public bool xoaThiSinh(string ma)
        {
            ThongTinCaNhan tt = tnth.ThongTinCaNhans.Where(t => t.MaTS == Convert.ToInt32(ma)).FirstOrDefault();
            try
            {
                tnth.ThongTinCaNhans.DeleteOnSubmit(tt);
                tnth.SubmitChanges();
                return true;
            }
            catch 
            {
                return false;
            }
        }
        public List<ThongTinCaNhan> getThongTinCaNhan()
        {
            var getTTCN = from ttcn in tnth.ThongTinCaNhans select ttcn;
            return getTTCN.ToList<ThongTinCaNhan>();
        }


      
    }
}

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
        public IQueryable getCauHoi2()
        {
            var cauhois = from ch in tnth.CauHois
                          select new { ch.MaCH, ch.NoiDungCH, ch.DoKho };
          
            return cauhois;
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
        public IQueryable loadLoaiTK(string maQuyen)
        {
            var loaitk = from tk in tnth.PhanQuyens
                                where tk.MaLoaiTK.Equals(maQuyen)
                                select tk;
            return loaitk;
        }
        public IQueryable loaddotThi()
        {
            var loaidt = from d in tnth.DotThis select d;
            return loaidt;
        }

        public int saveDangKy(string hovaten,string email,string sdt,string cmnd, string mk,DateTime ngaysinh,string maloaiTK, string maKyThi)
        {
            ThongTinCaNhan tt = new ThongTinCaNhan();
          
            tt.HoVaTenTS = hovaten;
            tt.Email = email;
            tt.NgaySinh = ngaysinh;
            tt.SDT = sdt;
            tt.CMND = cmnd;
            tt.MatKhau = mk;
            tt.MaLoaiTK = maloaiTK;
            tt.MaKyThi = maKyThi;
            try
            {
                tnth.ThongTinCaNhans.InsertOnSubmit(tt);
               
                tnth.SubmitChanges();
                return 1;
            }
            catch { }
            return 0; 


        }
        public bool saveKetQua(int maThiSinh,string maKyThi, int diem)
        {
            KetQua kq = new KetQua();
            kq.MaTS = maThiSinh;
            kq.Diem = diem;
            kq.MaKT = maKyThi;
            try
            {   
                tnth.KetQuas.InsertOnSubmit(kq);
                tnth.SubmitChanges();
                return true;
            }
            catch
            {
               
            } return false; 
        }

        public IQueryable getThiSinh()
        {
            var thongtincanhans = from ts in tnth.ThongTinCaNhans
                                  select new { ts.MaTS, ts.HoVaTenTS, ts.Email, ts.CMND, ts.MatKhau, ts.NgaySinh, ts.SDT };
            return thongtincanhans;
        }
        public KyThi getThoiGianLamBai(string maKT)
        {
            KyThi kt = tnth.KyThis.Where(t => t.MaKT.Equals(maKT)).FirstOrDefault();
            return kt;
        }
        public IQueryable getThiSinh(string loaiTK)
        {
            var thongtincanhans = from ts in tnth.ThongTinCaNhans
                                               where ts.MaLoaiTK.Equals(loaiTK)
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


        public bool themCauHoi(string noiDungCH, int doKho, List<DapAn> lstDA)
        {

            CauHoi ch = new CauHoi();
            DapAn da;
            ch.NoiDungCH = noiDungCH;
            ch.DoKho = doKho;
            ch.HinhThucCH = null;
            
                try
                {
                    tnth.CauHois.InsertOnSubmit(ch);
                    tnth.SubmitChanges();
                    for (int i = 0; i < lstDA.Count; i++)
                    {
                        da = new DapAn();
                        da.MaCH = ch.MaCH;
                        da.NoiDungDA = lstDA[i].NoiDungDA;
                        da.DungSai = lstDA[i].DungSai;
                        tnth.DapAns.InsertOnSubmit(da);
                    }
                    
                    tnth.SubmitChanges();
                    return true;
                }
                catch { return false; }
            
        }
        public bool xoaCauHoi(int maCH)
        {
            CauHoi xoaCH = tnth.CauHois.Where(t => t.MaCH == maCH).FirstOrDefault();
            var dapans = from da in tnth.DapAns 
                         where da.MaCH == maCH 
                         select da;
            List<DapAn> lstDA = dapans.ToList<DapAn>();
            try
            {
                tnth.CauHois.DeleteOnSubmit(xoaCH);
                for (int i = 0; i < lstDA.Count; i++)
                    tnth.DapAns.DeleteOnSubmit(lstDA[i]);

                tnth.CauHois.DeleteOnSubmit(xoaCH);
                tnth.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        private List<int> getMaDapAn(int maCH)
        {
            var dapans = from da in tnth.DapAns
                         where da.MaCH == maCH
                         select da.MaDA;
            List<int> lstDA = dapans.ToList<int>();
            return lstDA;
                         
        }
        public bool suaCauHoi(int maCH, string noiDungCH,int doKho, List<DapAn> lstDA)
        {
            CauHoi ch = tnth.CauHois.Where(t => t.MaCH == maCH).FirstOrDefault();
            ch.NoiDungCH = noiDungCH;
            ch.DoKho = doKho;

            List<int> lst = getMaDapAn(maCH);
            DapAn da;
            try
            {
                for (int i = 0; i < lst.Count; i++)
                {
                    da = tnth.DapAns.Where(t => t.MaDA == lst[i]).FirstOrDefault();
                    da.NoiDungDA = lstDA[i].NoiDungDA;
                    da.DungSai = lstDA[i].DungSai;
                }

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
        public IQueryable loadKyThi(string madotthi)
        {
            var kt = from k in tnth.KyThis
                     join l in tnth.DotThis on k.MaNgayThi equals l.MaNgayThi
                     where k.MaNgayThi == madotthi
                     select new { k.MaKT, k.DotThi };
            return kt;
        }
        //frm quan ly dot thi
        public IQueryable loadDSDotthi()
        {
            var dt = from d in tnth.DotThis select d;
            return dt;
        }
        public IQueryable loadDSKyThi()
        {
            var kt = from k in tnth.KyThis select new { k.MaNgayThi, k.ThoiGianLamBai, k.MaKT, k.DotThi };
            return kt;

        }



        public int xoaKT(string kt)
        {
            KyThi k = tnth.KyThis.Where(t => t.MaKT == kt).FirstOrDefault();
            if (k != null)
            {
                ThongTinCaNhan ttcn = tnth.ThongTinCaNhans.Where(c => c.MaKyThi == k.MaKT).FirstOrDefault();
                if (ttcn != null)
                {
                    tnth.ThongTinCaNhans.DeleteOnSubmit(ttcn);
                    tnth.SubmitChanges();
                }
                tnth.KyThis.DeleteOnSubmit(k);
                tnth.SubmitChanges();
                return 1;
            }
            else
                return 2;
        }
        public int xoaDT(string madt)
        {
            DotThi dt = tnth.DotThis.Where(d => d.MaNgayThi == madt).FirstOrDefault();
            if (dt != null)
            {
                KyThi kt = tnth.KyThis.Where(k => k.MaNgayThi == dt.MaNgayThi).FirstOrDefault();
                if (kt != null)
                {

                    ThongTinCaNhan tcn = tnth.ThongTinCaNhans.Where(tc => tc.MaKyThi == kt.MaKT).FirstOrDefault();
                    if (tcn != null)
                    {
                        KetQua k = tnth.KetQuas.Where(kq => kq.MaTS == tcn.MaTS && kq.MaKT == kt.MaKT).FirstOrDefault();
                        if (k != null)
                        {
                            tnth.KetQuas.DeleteOnSubmit(k);
                            tnth.SubmitChanges();
                        }
                        tnth.ThongTinCaNhans.DeleteOnSubmit(tcn);
                        tnth.SubmitChanges();
                    }
                    tnth.KyThis.DeleteOnSubmit(kt);
                    tnth.SubmitChanges();
                }
                tnth.DotThis.DeleteOnSubmit(dt);
                tnth.SubmitChanges();
                return 1;
            }
            return 0;
        }

        public int suaDT(string madt, DateTime ngaythi, int sldk)
        {
            DotThi dt = tnth.DotThis.Where(d => d.MaNgayThi == madt).FirstOrDefault();
            if (dt != null)
            {
                dt.NgayThi = ngaythi;
                dt.SoLuongDK = sldk;
                tnth.SubmitChanges();
                return 1;
            }
            else
                return 0;
        }
        public int themDT(string madt, DateTime ngaythi, int sldk)
        {
            //DotThi dt = tnth.DotThis.Where(dot => dot.MaNgayThi == madt).FirstOrDefault();
            DotThi d = new DotThi();
            d.MaNgayThi = madt;
            d.NgayThi = ngaythi;
            d.SoLuongDK = sldk;
            //if (dt == null)
            
           
                try
                {
                    tnth.DotThis.InsertOnSubmit(d);
                    tnth.SubmitChanges();
                    return 1;
                }
                catch { return 0; }
            //}
            //else
            //    return 0;
        }


        public int suaKT(string makt, string madt, int dotthi, int thoigian)
        {
            KyThi kt = tnth.KyThis.Where(k => k.MaKT == makt).FirstOrDefault();
            if (kt != null)
            {
                kt.MaNgayThi=madt;
                kt.ThoiGianLamBai = thoigian;
                kt.DotThi = dotthi;
                tnth.SubmitChanges();
                return 1;
            }
            else
                return 0;
        }
        public int themKT(string makt,string madt, int dotthi, int thoigian)
        {
            KyThi kt = new KyThi();
            kt.MaKT = makt;
            kt.MaNgayThi = madt;
            kt.ThoiGianLamBai = thoigian;
            kt.DotThi = dotthi;
            try {
                tnth.KyThis.InsertOnSubmit(kt);
                tnth.SubmitChanges();
                return 1;
            }
            catch { return 0; }
        }
      
    }
}

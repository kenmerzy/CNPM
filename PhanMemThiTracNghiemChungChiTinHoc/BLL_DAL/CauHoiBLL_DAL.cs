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

      
    }
}

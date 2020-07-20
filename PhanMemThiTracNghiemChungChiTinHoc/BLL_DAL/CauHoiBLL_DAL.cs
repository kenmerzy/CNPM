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
    }
}

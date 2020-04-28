using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.ViewModels
{
    public class SearchViewModel
    {
        public string Title { get; set; }
        public string Subtitle { get; set; }
        public string AuthorName { get; set; }
        public DateTime? ArticleDates { get; set; }
        public string Url { get; set; }
    }
}

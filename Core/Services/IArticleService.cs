using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Umbraco.Core.Models.PublishedContent;

namespace Core.Services
{
    public interface IArticleService
    {
        IPublishedContent GetArticleListPage(IPublishedContent siteRoot);
        IEnumerable<IPublishedContent> GetLastesArticle(IPublishedContent siteRoot);
    }
}

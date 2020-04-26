using System;
using System.Collections.Generic;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Umbraco.Core.Models.PublishedContent;
using Umbraco.Web;

namespace Core.Services
{
    public class ArticleService : IArticleService
    {
        public IPublishedContent GetArticleListPage(IPublishedContent siteRoot)
        {
            var articleList = siteRoot.Descendant().FirstChild(x => x.ContentType.Alias == "articleList");
            return articleList;
        }

        public IEnumerable<IPublishedContent> GetLastesArticle(IPublishedContent siteRoot)
        {
            var articleList = GetArticleListPage(siteRoot);
            var article = articleList.Descendant().Children(x => x.ContentType.Alias == "article" && x.IsVisible()).OrderByDescending(y=>y.Value<DateTime>("articleDate"));
            return article;
        }
    }
}

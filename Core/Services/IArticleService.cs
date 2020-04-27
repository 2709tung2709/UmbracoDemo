using Core.ViewModels;
using System.Collections.Generic;
using Umbraco.Core.Models.PublishedContent;

namespace Core.Services
{
    public interface IArticleService
    {
        IPublishedContent GetArticleListPage(IPublishedContent siteRoot);
        IEnumerable<IPublishedContent> GetLatesArticles(IPublishedContent siteRoot);
        ArticleResultSet GetLatestArticles(IPublishedContent currentContentItem, System.Web.HttpRequestBase request);
    }
}

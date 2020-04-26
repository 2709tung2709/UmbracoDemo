using Core.Services;
using Umbraco.Core;
using Umbraco.Core.Cache;
using Umbraco.Core.Services;
using Umbraco.Web.Mvc;
using Current = Umbraco.Web.Composing.Current;
namespace Core.ViewPage
{
    public abstract class CustomViewPage<T> : Umbraco.Web.Mvc.UmbracoViewPage<T>
    {
        public readonly IArticleService ArticleService;

        public CustomViewPage() : this(
            Current.Factory.GetInstance<IArticleService>(),
            Current.Factory.GetInstance<ServiceContext>(),
            Current.Factory.GetInstance<AppCaches>()
        )
        {
        }
        public CustomViewPage(IArticleService articleService, ServiceContext services, AppCaches appCaches)
        {
            ArticleService = articleService;
            Services = services;
            AppCaches = appCaches;
        }
    }

    public abstract class CleanBlogViewPage : UmbracoViewPage
    {
        public readonly IArticleService ArticleService;
        public CleanBlogViewPage() : this(
            Current.Factory.GetInstance<IArticleService>(),
            Current.Factory.GetInstance<ServiceContext>(),
            Current.Factory.GetInstance<AppCaches>()
        )
        { }

        public CleanBlogViewPage(IArticleService articleService, ServiceContext services, AppCaches appCaches)
        {
            ArticleService = articleService;
            Services = services;
            AppCaches = appCaches;
        }
    }
}

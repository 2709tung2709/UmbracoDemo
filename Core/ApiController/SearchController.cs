using Core.ViewModels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Umbraco.Web;
using Umbraco.Web.WebApi;

namespace Core.ApiController
{
    public class SearchController : UmbracoApiController
    {
        [HttpGet]
        public List<SearchViewModel> SearchAll([FromUri]string q)
        {
            var results = Umbraco.ContentQuery.Search(q);
            long resultCount = results != null && results.Any() ? results.Count() : 0;
            if (resultCount > 0)
            {
                var returnResult = results.Select(result => new SearchViewModel
                {
                    Title = result.Content.Value<string>("title"),
                    Subtitle = result.Content.Value<string>("subtitle"),
                    AuthorName = result.Content.Value<string>("authorName"),
                    ArticleDates = result.Content.Value<DateTime>("articleDate"),
                    Url = result.Content.Url
                }).ToList();

                return returnResult;
            }

            return null;
        }

    }
}

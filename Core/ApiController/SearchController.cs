using Core.ViewModels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Web.Mvc;
using Umbraco.Web;
using Umbraco.Web.WebApi;

namespace Core.ApiController
{
    //[Route("api/search")]
    public class SearchController : UmbracoApiController
    {
        [HttpGet]
        //[System.Web.Http.Route("search")]
        public List<object> Test(string searchQuery)
        {
            var results = Umbraco.ContentQuery.Search(searchQuery, string.Empty);
            long resultCount = results != null && results.Any() ? results.Count() : 0;
            var resultsList = new List<object>();
            if (resultCount > 0)
            {
                foreach (var result in results)
                {
                    var title = result.Content.Value<string>("title");
                    var subtitle = result.Content.Value<string>("subtitle");
                    var authorName = result.Content.Value<string>("authorName");
                    var articleDate = result.Content.Value<DateTime>("articleDate");
                    resultsList.Add(result);
                }

                //var r = results.Select(result => new SearchViewModel {
                //    Title = result.Content.Value<string>("title"),
                //    Subtitle = result.Content.Value<string>("subtitle"),
                //    AuthorName = result.Content.Value<string>("authorName"),
                //    ArticleDates = result.Content.Value<DateTime>("articleDate")
                //}).ToList();


                return resultsList;
            }

            return null;
        }
    }
}

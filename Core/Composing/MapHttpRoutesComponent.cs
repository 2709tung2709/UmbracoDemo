using System.Web.Http;
using Umbraco.Core.Composing;

namespace Core.Composing
{
    //Those classes are required to run UmbracoWebApi
    [RuntimeLevel(MinLevel =Umbraco.Core.RuntimeLevel.Run)]
    public class MapHttpRoutesComposer : ComponentComposer<MapHttpRoutesComponent>
    {
    }

    public class MapHttpRoutesComponent : IComponent
    {
        // initialize: runs once when Umbraco starts
        public void Initialize()
        {
            GlobalConfiguration.Configuration.MapHttpAttributeRoutes();
        }

        public void Terminate()
        {

        }
    }
}

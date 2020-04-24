using Core.Services;
using LightInject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Umbraco.Core.Composing;

namespace Core.Composing
{
    public class RegisterServicesComposer : IUserComposer
    {
        //private ILifetime _lifetime;
        //public RegisterServicesComposer()
        //{
        //    _lifetime = new 
        //}
        public void Compose(Composition composition)
        {
            composition.Register(typeof(ISmtpService), typeof(SmtpService), Lifetime.Request);
            //var serviceContainer = composition.Concrete as LightInject.ServiceContainer;
            //serviceContainer.Register<ISmtpService,SmtpService>();
        }
    }
}

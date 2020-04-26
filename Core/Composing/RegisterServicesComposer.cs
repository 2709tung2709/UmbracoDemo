﻿using Core.Services;
using LightInject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Umbraco.Core.Composing;
using Umbraco.Core;

namespace Core.Composing
{
    public class RegisterServicesComposer : IUserComposer
    {
        public void Compose(Composition composition)
        {
            //composition.Register(typeof(ISmtpService), typeof(SmtpService), Lifetime.Request);
            composition.Register<ISmtpService, SmtpService>(Lifetime.Singleton);
            //var serviceContainer = composition.Concrete as LightInject.ServiceContainer;
            //serviceContainer.Register<ISmtpService,SmtpService>();

            composition.Register<IArticleService, ArticleService>(Lifetime.Singleton);
        }
    }
}

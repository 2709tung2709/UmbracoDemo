using Core.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Services
{
    public interface ISmtpService
    {
        bool SendEmail(ContactViewModel model);
    }
}

using Umbraco.Core.Logging;
using Core.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Umbraco.Web;
using Umbraco.Web.Mvc;

namespace Core.Controllers
{
    public class ContactController : SurfaceController
    {
        private readonly ILogger _logger;

        public ContactController(ILogger logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public ActionResult RenderForm()
        {
            var model = new ContactViewModel()
            {
                ContactFormId = CurrentPage.Id,
            };

            return PartialView("/Views/Partials/Contact/contactForm.cshtml", model);
        }

        [HttpPost]
        public ActionResult RenderForm(ContactViewModel model)
        {
            return PartialView("/Views/Partials/Contact/contactForm.cshtml", model);
        }

        public ActionResult SubmitForm(ContactViewModel model)
        {
            bool success = false;
            if (ModelState.IsValid)
            {
                success = SendEmail(model);
            }

            var contactPage = UmbracoContext.Content.GetById(false, model.ContactFormId);
            var successMessage = contactPage.Value<IHtmlString>("successMessage");
            var errorMessage = contactPage.Value<IHtmlString>("errorMessage");

            return PartialView("~/Views/Partials/Contact/result.cshtml", success ? successMessage : errorMessage);
        }

        public bool SendEmail(ContactViewModel model)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                SmtpClient smtpClient = new SmtpClient();

                string toAddress = "test@email.com";
                string fromAddress = "from@email.com";
                mailMessage.Subject = "";
                mailMessage.Body = model.Message;
                mailMessage.To.Add(new MailAddress(toAddress, toAddress));
                mailMessage.From = new MailAddress(fromAddress, fromAddress);

                smtpClient.Send(mailMessage);
                return true;
            }
            catch(Exception ex)
            {
                _logger.Error(typeof(ContactController), ex, "Error");
                return false;
            }
        }
    }
}

using Core.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;
using Umbraco.Web.Mvc;

namespace Core.Controllers
{
    public class ContactController : SurfaceController
    {
        [HttpGet]
        public ActionResult RenderForm()
        {
            var model = new ContactViewModel()
            {
                ContactFormId = CurrentPage.Id,
            };

            return PartialView("/Views/Partials/Contact.contactForm.cshtml", model);
        }

        [HttpPost]
        public ActionResult RenderForm(ContactViewModel model)
        {
            return PartialView("/Views/Partials/Contact.contactForm.cshtml", model);
        }

        public ActionResult SubmitForm(ContactViewModel model)
        {
            bool success = false;
            if (ModelState.IsValid)
            {
                success = SendEmail();
            }

            var contactPage = UmbracoContext.Content.GetById(false, model.ContactFormId);

        }

        public bool SendEmail()
        {
            return false;
        }
    }
}

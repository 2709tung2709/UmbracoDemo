using Core.ViewModels;
using System;
using System.Net.Mail;
using Umbraco.Core.Logging;

namespace Core.Services
{
    public class SmtpService : ISmtpService
    {
        private readonly ILogger _logger;

        public SmtpService(ILogger logger)
        {
            _logger = logger;
        }
        public SmtpService()
        {

        }

        public bool SendEmail(ContactViewModel model)
        {
            try
            {
                MailMessage mailMessage = new MailMessage();
                SmtpClient smtpClient = new SmtpClient();

                string toAddress = "test@email.com";
                string fromAddress = "fromAdmin@email.com";
                mailMessage.Subject = $"Enquiry from: {model.Name} - {model.Email}";
                mailMessage.Body = model.Message;
                mailMessage.To.Add(new MailAddress(toAddress, toAddress));
                mailMessage.From = new MailAddress(fromAddress, fromAddress);

                smtpClient.Send(mailMessage);
                return true;
            }
            catch (Exception ex)
            {
                _logger.Error(typeof(SmtpService), ex, "Error");
                return false;
            }
        }
    }
}

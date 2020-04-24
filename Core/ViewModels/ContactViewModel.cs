using System.ComponentModel.DataAnnotations;

namespace Core.ViewModels
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "You must enter a valid email address")]
        public string Email { get; set; }

        [Required(ErrorMessage ="Must enter a message")]
        [MaxLength(500, ErrorMessage ="Max 500 Characters allowed")]
        public string Message { get; set; }
        public int ContactFormId { get; set; }
    }
}

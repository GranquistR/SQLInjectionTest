using Microsoft.AspNetCore.Mvc.RazorPages;
using SQLInjectionTest.Entities;
using SQLInjectionTest.Services;

namespace SQLInjectionTest.Pages
{
    public class CarsUnsecureModel : PageModel
    {
        public List<Car> Cars { get; private set; } = new List<Car>();
        public string RequestedName { get; set; }

        public bool Error { get; set; }

        public void OnGet()
        {
            Cars = new List<Car>();
        }

        public void OnPost(string requestedName)
        {
            Error = false;
            try
            {
                if (requestedName != null)
                {
                    RequestedName = requestedName;
                    Cars = VulnerableDataAccess.GetCarsByName(RequestedName);
                }
            }
            catch (Exception)
            {
                Cars = new List<Car>();
                Error = true;
            }
        }
    }
}

using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CapstoneWebApp.Startup))]
namespace CapstoneWebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

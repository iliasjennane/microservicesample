using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using simpleapi.DataAccess;

namespace simpleapi {
    public class Startup {
        public Startup (IConfiguration configuration) {
            Configuration = configuration;
        }
        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices (IServiceCollection services) {
            var connectionString = buildConnectionString ();
            services.AddDbContext<ApiContext> (options => options.UseSqlServer (
                connectionString,
                b => b.MigrationsAssembly ("simpleapi")
            ));
            services.AddTransient<IUnitOfWork<ApiContext>, UnitOfWork<ApiContext>> ();
            services.AddCors ();
            services.AddMvc ();
        }

        private string buildConnectionString () {
            string apiAppDbConnectionString = Environment.GetEnvironmentVariable ("apiDbConnectionString");
            if (String.IsNullOrEmpty(apiAppDbConnectionString))
            {
                string apiAppDbServerName = Environment.GetEnvironmentVariable ("apiAppDatabaseServer");
                if (string.Equals (apiAppDbServerName, "localdb")) {
                    apiAppDbServerName = "(localdb)\\MSSQLLocalDB";
                }
                string apiAppDbName = Environment.GetEnvironmentVariable ("apiAppDatabaseName");
                string apiAppDatabaseUser = Environment.GetEnvironmentVariable ("apiAppDatabaseUser");
                string apiAppDatabasePassword = Environment.GetEnvironmentVariable ("apiAppDatabasePassword");
                if (!String.IsNullOrEmpty (apiAppDatabaseUser)) {
                    apiAppDbConnectionString = $"Server={apiAppDbServerName};Database={apiAppDbName};UID={apiAppDatabaseUser};PASSWORD={apiAppDatabasePassword}; ";
                } else {
                    apiAppDbConnectionString = $"Server={apiAppDbServerName};Database={apiAppDbName};Trusted_Connection=True";
                }
            }
            return apiAppDbConnectionString;
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
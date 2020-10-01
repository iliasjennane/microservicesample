using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using simpleapi.Entities;
using System;
using System.IO;

namespace simpleapi.DataAccess
{
    public partial class ApiContext : DbContext
    {
        public DbSet<Customer> Customers { get; set; }
        public ApiContext()
        {

        }
        public ApiContext(DbContextOptions<ApiContext> options) : base(options) { }

    }
}
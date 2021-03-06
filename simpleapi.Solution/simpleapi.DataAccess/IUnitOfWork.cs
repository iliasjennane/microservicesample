using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;

namespace simpleapi.DataAccess {
    public interface IUnitOfWork<TDbContext> where TDbContext : DbContext, new () {
        TDbContext DbContext { get; }
        System.Threading.Tasks.Task<int> SaveAsync ();
    }
}
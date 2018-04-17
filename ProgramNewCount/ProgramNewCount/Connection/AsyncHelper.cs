using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ProgramNewCount.Connection
{
    internal class AsyncHelper
    {
        private static readonly TaskFactory _myTaskFactory = new
     TaskFactory(CancellationToken.None,
                 TaskCreationOptions.None,
                 TaskContinuationOptions.None,
                 TaskScheduler.Default);

        public static TResult RunSync<TResult>(Func<Task<TResult>> func)
        {
            try
            {
 return AsyncHelper._myTaskFactory
              .StartNew<Task<TResult>>(func)
              .Unwrap<TResult>()
              .GetAwaiter()
              .GetResult();
            }
            catch (Exception)
            {

                throw;
            }
           
        }

        public static void RunSync(Func<Task> func)
        {
            AsyncHelper._myTaskFactory
              .StartNew<Task>(func)
              .Unwrap()
              .GetAwaiter()
              .GetResult();
        }
    }
}

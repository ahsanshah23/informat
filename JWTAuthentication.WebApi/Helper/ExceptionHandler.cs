using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;
using System.Net;
using com.Informat.WebAPI.Models;
using log4net.Config;
using log4net;
using log4net.Core;
using System.Xml;
using System.Reflection;
using System.IO;

namespace com.Informat.WebAPI.Helper
{
    public class ExceptionHandler
    {
        //private static Logger logger = LogManager.GetCurrentClassLogger();
        private readonly RequestDelegate next;
        public ExceptionHandler(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context /* other dependencies */)
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private static Task HandleExceptionAsync(HttpContext context, Exception ex)
        {
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
            //logger.Error(ex);
            LogTraceFactory.LogMessage(ex.Message);
            var result = JsonConvert.SerializeObject(new ApiResponseDto()
            {
                Status_Code = context.Response.StatusCode,
                Message = ex.ToString() //"Internal Server Error from the custom middleware."
            });
            return context.Response.WriteAsync(result);

        }
    }

    public class ValidateModelAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (!context.ModelState.IsValid)
            {
                var model = new
                {
                    Staus_Code = (int)HttpStatusCode.BadRequest,
                    Error = context.ModelState
                .SelectMany(keyValuePair => keyValuePair.Value.Errors)
                .Select(modelError => modelError.ErrorMessage)
                .ToArray()
                };

                context.Result = new BadRequestObjectResult(model);
                //context.Result = new BadRequestObjectResult(context.ModelState);
            }

        }

    }

    public static class LogTraceFactory
    {

        private static ILog _logger = log4net.LogManager.GetLogger(typeof(LoggerManager));

        public static void LogMessage(string msg)
        {
            try
            {
                XmlDocument log4netConfig = new XmlDocument();

                using (var fs = File.OpenRead("log4net.config"))
                {
                    log4netConfig.Load(fs);
                    var repo = log4net.LogManager.CreateRepository(Assembly.GetEntryAssembly(), typeof(log4net.Repository.Hierarchy.Hierarchy));
                    XmlConfigurator.Configure(repo, log4netConfig["log4net"]);
                    _logger.Error(msg);
                }
            }
            catch (Exception ex)
            {
                _logger.Error("Error", ex);
            }
        }
    }
}

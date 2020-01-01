using System.Collections.Generic;
using System.Web.Http;

namespace SampleMvcApp.Controllers
{
    public class TestController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]Model value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]Model value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }

    public class Model
    {
        public string Value { get; set; }
    }
}
using System;
namespace pog{
	public class Person {
		public string name { get; set;}
	        public string job { get; set;}
		public string full {
			get {return "name: " + name + " and job: " + job}; 
		}


		public string GetData(){
			return "name: " + name + ", job: " + job;
		}
        }
}

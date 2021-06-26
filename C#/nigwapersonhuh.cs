using System;

namespace pog {
        public class Person {
                public string name { get; set;}
                public string job { get; set;}
                public string full {
                        get {
                                return "name: " + name + " and job: " + job;
                        }
                }


                public string GetData(){
                        return "name: " + name + ", job: " + job;
                }
        }

        class Program {
                static void Main(string[] args) {
                Person nigga = new Person();
                Console.WriteLine("What's the nigga's name?!");
                nigga.name = Console.ReadLine();                                                                                                              
                Console.WriteLine("What's his \"job\"");                                                                                                      
                nigga.job = Console.ReadLine();                                                                                                               
                Console.WriteLine(nigga.GetData());                                                                                                           
                Console.WriteLine(nigga.full);                                                                                                                
                }                                                                                                                                             
        }                                                                                                                                                     
}

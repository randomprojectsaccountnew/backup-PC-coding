using System;
using Person;
namespace hiv
{
    class Program
    {
        static void Main(string[] args)
        {
            Person nigga = new Person();
            Console.WriteLine("What's the nigga's name?!");
            nigga.name = Console.ReadLine();
	        Console.WriteLine("What's his job");
	        nigga.job = Console.ReadLine();
	        string s = nigga.GetData();
            Console.WriteLine("We have a badass over here: \""+s+"\"");
        }
    }
}

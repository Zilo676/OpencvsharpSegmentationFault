using System;
using System.Threading;
using OpenCvSharp;

namespace OpencvsharpSegmentationFault
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Start program");
            
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine(i);
                Thread.Sleep(1000);
            }

            var image = new Mat("./test.png");

            ;
            Console.WriteLine("End program");
        }
    }
}

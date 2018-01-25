using System.Collections.Generic;
using System.Diagnostics;

namespace BaumSweetCSharp
{
    public class BaumSweet
    {
        public int givenNumber = 0;
        public List<int> sequence = new List<int>();

        public BaumSweet(int number)
        {
            givenNumber = number;
        }

        public void startProcedure()
        {
            Debug.WriteLine($"starting sequence for {givenNumber}");
        }
    }
}

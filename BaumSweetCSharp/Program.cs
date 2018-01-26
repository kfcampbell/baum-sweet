using System;
using System.Collections.Generic;

// # baum-sweet: infinite binary sequence defined by:
// b_n = 1: if the binary representation of n contains no block of consecutive 0's of odd length
// b_n = 0: otherwise

// problem: given an integer, generate the baum-sweet sequence up to that number.
// ex input: 20
// ex output: [1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0]

namespace BaumSweetCSharp
{
    class Program
    {
        static void Main(string[] args)
        {
            BaumSweet bs = new BaumSweet(20);
            bs.startGame();
        }
    }
}

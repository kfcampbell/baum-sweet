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

        public void startGame()
        {
            Debug.WriteLine($"starting sequence for {givenNumber}");
            startProcedure();
        }

        private void startProcedure()
        {
            var i = 0;
            while (i <= givenNumber)
            {
                var currentBinaryNumber = generateBinaryRepresentation(i);
                var currentBlockSizes = getBlockSizes(currentBinaryNumber);
                sequence.Add(hasOddZeroBlockSize(currentBlockSizes));
                i++;
            }
            var sequenceString = string.Join(",", sequence);
            Debug.WriteLine($"sequence for {givenNumber}: {sequenceString}");
        }

        private List<int> generateBinaryRepresentation(int num)
        {
            if (num == 0)
                return new List<int> { 0, 0 };
            else if (num == 1)
                return new List<int> { 1 };

            Stack<int> stack = new Stack<int>();
            var temp = num;
            List<int> binaryRepresentation = new List<int>();

            while(temp >= 1)
            {
                stack.Push(temp);
                temp = temp / 2;
            }
            while(stack.Count > 0)
            {
                temp = stack.Pop();
                binaryRepresentation.Add(temp % 2);
            }

            return binaryRepresentation;
        }

        private List<int> getBlockSizes(List<int> binaryRepresentation)
        {
            int i = 0;
            var blockSizes = new List<int>();
            while(i < binaryRepresentation.Count)
            {
                var blockSize = 0;
                var j = 0;
                if(binaryRepresentation[i] == 0)
                {
                    blockSize = 1;
                    j = i + 1;
                    while(j < binaryRepresentation.Count)
                    {
                        if(binaryRepresentation[j] == 0)
                        {
                            blockSize++;
                            j++;
                        }
                        else
                            break;
                    }
                }
                if(blockSize != 0)
                {
                    blockSizes.Add(blockSize);
                    i = j;
                }
                i++;
            }
            return blockSizes;
        }

        private int hasOddZeroBlockSize(List<int> blockSizes)
        {
            var i = 0;
            while(i < blockSizes.Count)
            {
                if(blockSizes[i] % 2 != 0) // odd length found
                {
                    return 0;
                }
                i++;
            }
            return 1;
        }
    }
}

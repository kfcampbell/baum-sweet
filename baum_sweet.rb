# baum-sweet: infinite binary sequence defined by:
# b_n = 1: if the binary representation of n contains no block of consecutive 0's of odd length
# b_n = 0: otherwise

# problem: given an integer, generate the baum-sweet sequence up to that number.
# ex input: 20
# ex output: [1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0]

class BaumSweet

    def baum_sweet(num)
        if num > 0 
            puts "Generating Baum-Sweet sequence of #{num}."
            self.generate_sequence(num)
        else
            puts "#{num} is an invalid number to generate sequence."
        end
    end

    def generate_sequence(num)
        sequence = []
        i = 0
        while i <= num
            curr_bin_num = self.generate_binary_representation(i)
            sequence << self.contains_odd_zero_block(curr_bin_num)
            i += 1
        end
        puts "sequence for #{num}: #{sequence}"
    end

    def generate_binary_representation(num)
        if num == 0
            return [0, 0]
        elsif num == 1
            return [1]
        end

        temp = num
        stack = []
        binary_representation = []
        while temp >= 1
            stack.push(temp)
            temp = temp / 2
        end
        while stack.count > 0
            binary_representation.push(stack.pop % 2)
        end
        return binary_representation
    end

    def contains_odd_zero_block(binary_num)
        query = /(?<!0)(00)*0(?!0)/
        num = binary_num.join("")
        matches = query.match(num)
        if matches
            return 0
        end
        return 1
    end
end

game = BaumSweet.new.baum_sweet(20)
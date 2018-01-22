# baum-sweet: infinite binary sequence defined by:
# b_n = 1: if the binary representation of n contains no block of consecutive 0's of odd length
# b_n = 0: otherwise

# problem: given an integer, generate the baum-sweet sequence up to that number.
# ex input: 20
# ex output: [1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0]

class BaumSweet
    attr_accessor :given_num, :sequence

    def initialize
        @given_num = 0
        @sequence = []
    end

    def start_game
        puts "Input an integer."
        @given_num = 20 # gets.to_i doesn't work in vscode so leave out for debugging purposes for now
        self.start_procedure unless @given_num < 1
    end

    def start_procedure
        i = 0
        while i <= @given_num
            curr_bin_num = self.generate_binary_representation(i)
            curr_block_sizes = self.get_block_sizes(curr_bin_num)
            @sequence << self.has_odd_zero_block_size(curr_block_sizes)
            i += 1
        end
        puts "sequence for #{@given_num}: #{@sequence}"
    end

    def generate_binary_representation(num)
        if num == 0
            return [0, 0]
        elsif num == 1
            return [1]
        end

        stack = []
        temp = num
        bin = []
        while temp >= 1
            stack.push(temp)
            temp = temp / 2
        end
        while stack.count > 0
            temp = stack.pop
            bin.push(temp % 2)
        end
        return bin
    end

    def get_block_sizes(binary_num)
        i = 0
        block_sizes = []
        while i < binary_num.count
            if binary_num[i] == 0
                block_size = 1
                j = i + 1
                while j < binary_num.count
                    if binary_num[j] == 0
                        block_size += 1
                        j += 1
                    else
                        break
                    end
                end
            block_sizes.push(block_size)
            i = j
            end
            i += 1
        end
        return block_sizes
    end

    def has_odd_zero_block_size(block_sizes)
        i = 0
        while i < block_sizes.count
            if block_sizes[i] % 2 != 0 # odd length found
                return 0
            end
            i += 1
        end
        return 1 
    end
end

game = BaumSweet.new
game.start_game
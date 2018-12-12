class Cell
    def initialize()
        @value = 0
        @added_links = []
        @opcode = 0
    end

    def value()
        @value
    end

    def set_Value(value)
        @value = Integer(value)
        self.update_linked
    end

    def update_linked()
        @added_links.each { |x| x.update }
    end

    def addLink(resultCell)
        @added_links << resultCell
    end

    def set_Condition(cell1,cell2,opcode)
        @cell1 = cell1
        @cell2 = cell2
        @opcode = opcode
    end

    def unlink(obj)
        @added_links.delete(obj)
    end 

    def unset_condition()
        @cell1.unlink(self)
        @cell2.unlink(self)
        @opcode = nil
    end

    def update()
        if @opcode == 1 then self.set_Value(@cell1.value + @cell2.value)
        elsif @opcode == 2 then self.set_Value(@cell1.value - @cell2.value)
        elsif @opcode == 3 then self.set_Value(@cell1.value * @cell2.value)
        elsif @opcode == 4 then self.set_Value(@cell1.value / @cell2.value)
        end
        @added_links.each { |x| x.update }
    end
end


class Board
    def initialize(size)
        @size = size
        @board_cells = []
        (size*size).times { @board_cells << Cell.new }
    end
    def get_cell(id)
        row = id[0].ord - 'A'.ord
        colum = Integer(id[1])
        index = (row*@size) + colum
        #puts "index #{id} : #{id[0].to_i} #{colum} #{index}"
        return @board_cells[index]
    end
    def set_Value(id,value)
        cell = get_cell(id)
        cell.set_Value(Integer(value))
    end
    def set_Condition( result, id1, id2, opcode)
        cell1 = self.get_cell(id1)
        cell2 = self.get_cell(id2)
        cell_result = self.get_cell(result)
        cell_result.set_Condition(cell1,cell2,opcode)
        cell1.addLink(cell_result)
        cell2.addLink(cell_result)
        cell_result.update()
    end
    def display()
        (@size*@size).times do |x|
            puts ""if x % @size == 0
            obj = @board_cells[x]
            print " #{obj.value}"
        end
        puts ""
    end
end

puts "Mention the size of the execl"

opcode_dict = {
    "+" => 1,
    "-" => 2,
    "*" => 3,
    "/" => 4
}

size = Integer(gets.chomp)
exl_sheet = Board.new(size)

while true do
    inputs = gets.chomp.split(" ")
    if inputs.length == 1
        exl_sheet.display()
    elsif inputs.length == 2
        exl_sheet.set_Value(inputs[0],inputs[1])
    else
        exl_sheet.set_Condition(inputs[0], inputs[1], inputs[3], opcode_dict[inputs[2]])
    end
end
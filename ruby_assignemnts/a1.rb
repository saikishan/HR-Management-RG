line  = gets
total_intvalue = 0
total_count = 0
current_intvalue = 0 
neg_active = false

line.each_char do |x|
    bool = (("0".."9").to_a.include? x) && !neg_active
    puts "#{x} , #{bool}"
    if x=='-'
        if current_intvalue > 0
            puts x
            total_intvalue += current_intvalue
            total_count += 1
            current_intvalue = 0
        end
        neg_active = true
    elsif (("0".."9").to_a.include? x) && !neg_active
        puts x
        current_intvalue = current_intvalue * 10 + Integer(x)
    else
        next if ("0".."9").to_a.include? x
        if current_intvalue > 0
            puts x
            total_intvalue += current_intvalue
            total_count += 1
            current_intvalue = 0
        end
        neg_active = false
    end
end

puts "the total value is #{total_intvalue} total_count = #{total_count}"


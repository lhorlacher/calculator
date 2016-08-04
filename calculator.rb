Ops = ["+", "-", "*", "/", "**", "%"]
Float = /^[-+]?[\d]*\.?[\d]+$/
Standard_commands = ["menu", "clear", "history", "quit", "store", "recall"]
@history = []
@memory = 0
@solution = 0

def calc_main
	
	while true
		puts "What is the first number?"
		num1 = gets.strip
		if num1 =~ Float
			break
		elsif Standard_commands.include?(num1.downcase)
			calc_functions(num1)
		else
			puts "Invalid entry. Enter a number or type 'menu' to see available commands."
		end
	end

	while true
		while true
			puts "What operation would you like to perform?"
			operator = gets.strip
			if Ops.include?(operator)
				break
			elsif Standard_commands.include?(operator.downcase)
				calc_functions(operator)
			else
				puts "Invalid entry. Enter an operator [ + - * / ** %] or type menu to see available commands."
			end
		end

		while true
			puts "What is the second number?"
			num2 = gets.strip
			if num2 =~ /^[0]+\.?[0]*$/ && operator == "/"
				puts "Please don't try to divide by 0. You know better..."
			elsif num2 =~ Float
				break
			elsif Standard_commands.include?(operator.downcase)
				calc_functions(num2)
			else
				puts "Invalid entry. Enter a number or type 'menu' to see available commands."
			end
		end

	@solution = num1.to_f.send(operator, num2.to_f).round(7)
	puts "#{num1} #{operator} #{num2} = #{@solution}."
	@history.push("#{num1} #{operator} #{num2} = #{@solution}")
	num1 = @solution
	end
end

def calc_functions(command)
	case command
		when "clear"
			@history = []
			calc_main
		when "history"
			puts "History: "
			@history.empty? ? (puts "Empty.") : (puts @history)
		when "quit"
			exit(0)
		when "store"
			@memory = @solution
			puts "Value #{@memory} stored in memory. Type 'recall' to view stored value."
		when "recall"
			puts "Stored value: #{@memory}."
		when "menu"
		puts """
----------------------------\n
AVAILABLE COMMANDS		
menu: see available commands
clear: clear history and begin calculator again. does not affect stored value.
history: view previously executed operations.
store: store a single value from most recent completed operation.
recall: view stored value
quit: exit calculator \n
----------------------------
"""
		else
			nil
	end	
end

puts "----------------------------\n"
puts "Welcome to Calculator."
puts "Type 'menu' at any time to see available\n"
puts "----------------------------"

calc_main
		








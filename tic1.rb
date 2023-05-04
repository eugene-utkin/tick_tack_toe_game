# encoding: cp1251

if (Gem.win_platform?)
        Encoding.default_external = Encoding.find(Encoding.locale_charmap)
        Encoding.default_internal = __ENCODING__

        [STDIN, STDOUT].each do |io|
                io.set_encoding(Encoding.default_external, Encoding.default_internal)
        end
end
puts "   1   2   3 "
puts "1 [ ] [ ] [ ]"
puts "2 [ ] [ ] [ ]"
puts "3 [ ] [ ] [ ]"
puts
puts "Куда поставить крестик?"
puts "Укажите клетку с помощью двух чисел."
puts "Например, 11 или 22. Первое число - вертикаль. Второе - горизонталь."
puts

board = { '11' => '[ ]', '12' => '[ ]', '13' => '[ ]', '21' => '[ ]', '22' => '[ ]', '23' => '[ ]', '31' => '[ ]', '32' => '[ ]', '33' => '[ ]'}

danger = { '11' => 0, '12' => 0, '13' => 0, '21' => 0, '22' => 0, '23' => 0, '31' => 0, '32' => 0, '33' => 0}

freecells = 9
maxdanger = 0
opprand = 0
currentcell = 0
dangerouscells = []

loop do
	player = gets.strip
	if board.keys.include? player
		if board[player] == '[ ]'
			board[player] = '[x]'
			freecells = freecells - 1
			currentcell = 1
			#puts board
			puts "   1   2   3 "
			puts "1 #{board['11']} #{board['12']} #{board['13']}"
			puts "2 #{board['21']} #{board['22']} #{board['23']}"
			puts "3 #{board['31']} #{board['32']} #{board['33']}"
			puts
			if board['11'] == '[x]' && board['12'] == '[x]' && board['13'] == '[x]'
				puts "Вы одержали победу! Поздравляем!"
				exit
			end
			if board['21'] == '[x]' && board['22'] == '[x]' && board['23'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end
			if board['31'] == '[x]' && board['32'] == '[x]' && board['33'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end 
			if board['11'] == '[x]' && board['21'] == '[x]' && board['31'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end
			if board['12'] == '[x]' && board['22'] == '[x]' && board['32'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end
			if board['13'] == '[x]' && board['23'] == '[x]' && board['33'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end
			if board['11'] == '[x]' && board['22'] == '[x]' && board['33'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end
			if board['13'] == '[x]' && board['22'] == '[x]' && board['31'] == '[x]'
        			puts "Вы одержали победу! Поздравляем!"
        			exit
			end
			if freecells == 0
   				puts "У вас ничья. Игра окончена."
        			exit
			end
			puts "\nТеперь ходит противник!"
			board.each do |key, value|
				if value == '[x]'
					if key == '11'
						if board['12'] == '[ ]'
							danger['12'] = danger['12'] + 1
							if board['13'] == '[x]'
								danger['12'] = danger['12'] + 1
							end   	
						end
						if board['13'] == '[ ]'
							danger['13'] = danger['13'] + 1
							if board['12'] == '[x]'
        							danger['13'] = danger['13'] + 1
							end
						end
						if board['21'] == '[ ]'
							danger['21'] = danger['21'] + 1
							if board['31'] == '[x]'
        							danger['21'] = danger['21'] + 1
							end
						end
						if board['31'] == '[ ]'
							danger['31'] = danger['31'] + 1
							if board['21'] == '[x]'
        							danger['31'] = danger['31'] + 1
							end
						end
						if board['22'] == '[ ]'
							danger['22'] = danger['22'] + 1
							if board['33'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
						end
						if board['33'] == '[ ]'
							danger['33'] = danger['33'] + 1
							if board['22'] == '[x]'
        							danger['33'] = danger['33'] + 1
							end
						end
					end
					if key == '12'
        					if board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 1
							if board['13'] == '[x]'
        							danger['11'] = danger['11'] + 1
							end
        					end
        					if board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 1
							if board['11'] == '[x]'
        							danger['13'] = danger['13'] + 1
							end
        					end
        					if board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 1
							if board['32'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
        					end
        					if board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 1
						 	if board['22'] == '[x]'
        							danger['32'] = danger['32'] + 1
							end
        					end
					end
					if key == '13'
        					if board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 1
							if board['12'] == '[x]'
        							danger['11'] = danger['11'] + 1
							end
        					end
        					if board['12'] == '[ ]'
                					danger['12'] = danger['12'] + 1
							if board['11'] == '[x]'
        							danger['12'] = danger['12'] + 1
							end
        					end
        					if board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 1
							if board['33'] == '[x]'
        							danger['23'] = danger['23'] + 1
							end
        					end
        					if board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 1
							if board['23'] == '[x]'
        							danger['33'] = danger['33'] + 1
							end
        					end
						if board['22'] == '[ ]'
							danger['22'] = danger['22'] + 1
							if board['31'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
						end
						if board['31'] == '[ ]'
							danger['31'] = danger['31'] + 1
							if board['22'] == '[x]'
        							danger['31'] = danger['31'] + 1
							end
						end
					end
                                        if key == '21'
        					if board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 1
							if board['31'] == '[x]'
        							danger['11'] = danger['11'] + 1
							end
        					end
        					if board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 1
							if board['11'] == '[x]'
        							danger['31'] = danger['31'] + 1
							end
        					end
        					if board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 1
							if board['23'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
        					end
        					if board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 1
							if board['22'] == '[x]'
        							danger['23'] = danger['23'] + 1
							end
        					end
					end
					if key == '22'
        					if board['21'] == '[ ]'
                					danger['21'] = danger['21'] + 1
							if board['23'] == '[x]'
        							danger['21'] = danger['21'] + 1
							end
        					end
        					if board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 1
							if board['21'] == '[x]'
        							danger['23'] = danger['23'] + 1
							end
        					end
        					if board['12'] == '[ ]'
                					danger['12'] = danger['12'] + 1
							if board['32'] == '[x]'
        							danger['12'] = danger['12'] + 1
							end
        					end
        					if board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 1
							if board['12'] == '[x]'
        							danger['32'] = danger['32'] + 1
							end
        					end
						if board['11'] == '[ ]'
							danger['11'] = danger['11'] + 1
							if board['33'] == '[x]'
        							danger['11'] = danger['11'] + 1
							end
						end
						if board['33'] == '[ ]'
							danger['33'] = danger['33'] + 1
							if board['11'] == '[x]'
        							danger['33'] = danger['33'] + 1
							end
						end
						if board['13'] == '[ ]'
							danger['13'] = danger['13'] + 1
							if board['31'] == '[x]'
        							danger['13'] = danger['13'] + 1
							end
						end
						if board['31'] == '[ ]'
							danger['31'] = danger['31'] + 1
							if board['13'] == '[x]'
        							danger['31'] = danger['31'] + 1
							end
						end
					end
					if key == '23'
        					if board['21'] == '[ ]'
                					danger['21'] = danger['21'] + 1
							if board['22'] == '[x]'
        							danger['21'] = danger['21'] + 1
							end
        					end
        					if board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 1
							if board['21'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
        					end
        					if board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 1
							if board['33'] == '[x]'
        							danger['13'] = danger['13'] + 1
							end
        					end
        					if board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 1
							if board['13'] == '[x]'
        							danger['33'] = danger['33'] + 1
							end
        					end
					end
					if key == '31'
        					if board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 1
							if board['33'] == '[x]'
        							danger['32'] = danger['32'] + 1
							end
        					end
        					if board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 1
							if board['32'] == '[x]'
        							danger['33'] = danger['33'] + 1
							end
        					end
        					if board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 1
							if board['21'] == '[x]'
        							danger['11'] = danger['11'] + 1
							end
        					end
        					if board['21'] == '[ ]'
                					danger['21'] = danger['21'] + 1
							if board['11'] == '[x]'
        							danger['21'] = danger['21'] + 1
							end
        					end
						if board['22'] == '[ ]'
							danger['22'] = danger['22'] + 1
							if board['13'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
						end
						if board['13'] == '[ ]'
							danger['13'] = danger['13'] + 1
							if board['22'] == '[x]'
        							danger['13'] = danger['13'] + 1
							end
						end
					end
					if key == '32'
        					if board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 1
							if board['33'] == '[x]'
        							danger['31'] = danger['31'] + 1
							end
        					end
        					if board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 1
							if board['31'] == '[x]'
        							danger['33'] = danger['33'] + 1
							end
        					end
        					if board['12'] == '[ ]'
                					danger['12'] = danger['12'] + 1
							if board['22'] == '[x]'
        							danger['12'] = danger['12'] + 1
							end
        					end
        					if board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 1
							if board['12'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
        					end
					end
					if key == '33'
        					if board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 1
							if board['32'] == '[x]'
        							danger['31'] = danger['31'] + 1
							end
        					end
        					if board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 1
							if board['31'] == '[x]'
        							danger['32'] = danger['32'] + 1
							end
        					end
        					if board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 1
							if board['23'] == '[x]'
        							danger['13'] = danger['13'] + 1
							end
        					end
        					if board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 1
							if board['13'] == '[x]'
        							danger['23'] = danger['23'] + 1
							end
        					end
						if board['11'] == '[ ]'
							danger['11'] = danger['11'] + 1
							if board['22'] == '[x]'
        							danger['11'] = danger['11'] + 1
							end
						end
						if board['22'] == '[ ]'
							danger['22'] = danger['22'] + 1
							if board['11'] == '[x]'
        							danger['22'] = danger['22'] + 1
							end
						end
					end
				end
				if value == '[o]'
					if key == '11'
						if board['12'] == '[o]' && board['13'] == '[ ]'
							danger['13'] = danger['13'] + 10
						end
						if board['13'] == '[o]' && board['12'] == '[ ]'
        						danger['12'] = danger['12'] + 10
						end
						if board['21'] == '[o]' && board['31'] == '[ ]'
        						danger['31'] = danger['31'] + 10
						end
                                                if board['31'] == '[o]' && board['21'] == '[ ]'
        						danger['21'] = danger['21'] + 10
						end
						if board['22'] == '[o]' && board['33'] == '[ ]'
        						danger['33'] = danger['33'] + 10
						end
						if board['33'] == '[o]' && board['22'] == '[ ]'
        						danger['22'] = danger['22'] + 10
						end
					end
					if key == '12'
        					if board['11'] == '[o]' && board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 10
        					end
        					if board['13'] == '[o]' && board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 10
        					end
        					if board['22'] == '[o]' && board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 10
        					end
        					if board['32'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
					end
					if key == '13'
        					if board['12'] == '[o]' && board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 10
        					end
        					if board['11'] == '[o]' && board['12'] == '[ ]'
                					danger['12'] = danger['12'] + 10
        					end
        					if board['23'] == '[o]' && board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 10
        					end
        					if board['33'] == '[o]' && board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 10
        					end
        					if board['22'] == '[o]' && board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 10
        					end
        					if board['31'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
					end
					if key == '21'
        					if board['22'] == '[o]' && board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 10
        					end
        					if board['23'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
        					if board['11'] == '[o]' && board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 10
        					end
        					if board['31'] == '[o]' && board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 10
        					end
					end
					if key == '22'
        					if board['21'] == '[o]' && board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 10
        					end
        					if board['23'] == '[o]' && board['21'] == '[ ]'
                					danger['21'] = danger['21'] + 10
        					end
        					if board['12'] == '[o]' && board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 10
        					end
        					if board['32'] == '[o]' && board['12'] == '[ ]'
                					danger['12'] = danger['12'] + 10
        					end
        					if board['11'] == '[o]' && board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 10
        					end
        					if board['33'] == '[o]' && board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 10
        					end
						if board['13'] == '[o]' && board['31'] == '[ ]'
							danger['31'] = danger['31'] + 10
						end
						if board['31'] == '[o]' && board['13'] == '[ ]'
							danger['11'] = danger['11'] + 10
						end
					end
					if key == '23'
        					if board['21'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
        					if board['22'] == '[o]' && board['21'] == '[ ]'
                					danger['21'] = danger['21'] + 10
        					end
        					if board['13'] == '[o]' && board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 10
        					end
        					if board['33'] == '[o]' && board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 10
        					end
					end
					if key == '31'
        					if board['32'] == '[o]' && board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 10
        					end
        					if board['33'] == '[o]' && board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 10
        					end
        					if board['11'] == '[o]' && board['21'] == '[ ]'
                					danger['21'] = danger['21'] + 10
        					end
        					if board['21'] == '[o]' && board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 10
        					end
        					if board['13'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
        					if board['22'] == '[o]' && board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 10
        					end
					end
					if key == '32'
        					if board['31'] == '[o]' && board['33'] == '[ ]'
                					danger['33'] = danger['33'] + 10
        					end
        					if board['33'] == '[o]' && board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 10
        					end
        					if board['12'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
        					if board['22'] == '[o]' && board['12'] == '[ ]'
                					danger['12'] = danger['12'] + 10
        					end
					end
					if key == '33'
        					if board['31'] == '[o]' && board['32'] == '[ ]'
                					danger['32'] = danger['32'] + 10
        					end
        					if board['32'] == '[o]' && board['31'] == '[ ]'
                					danger['31'] = danger['31'] + 10
        					end
        					if board['13'] == '[o]' && board['23'] == '[ ]'
                					danger['23'] = danger['23'] + 10
        					end
        					if board['23'] == '[o]' && board['13'] == '[ ]'
                					danger['13'] = danger['13'] + 10
        					end
        					if board['11'] == '[o]' && board['22'] == '[ ]'
                					danger['22'] = danger['22'] + 10
        					end
        					if board['22'] == '[o]' && board['11'] == '[ ]'
                					danger['11'] = danger['11'] + 10
        					end
					end
				end
			end
			#puts danger
			danger.each do |key, value|
				if value > maxdanger
					maxdanger = value
				end
			end
			#puts maxdanger
			
			danger.each do |key, value|
				if value == maxdanger
					dangerouscells << key
				end
			end

			#puts dangerouscells
			opprand = rand(1..dangerouscells.size)
			

			board.each do |key, value|
				if dangerouscells.include? key
					if currentcell < opprand
			   			currentcell = currentcell + 1
					elsif currentcell == opprand
						board[key] = '[o]'
						currentcell = currentcell + 1
					end
				end
			end
			puts "   1   2   3 "
			puts "1 #{board['11']} #{board['12']} #{board['13']}"
			puts "2 #{board['21']} #{board['22']} #{board['23']}"
			puts "3 #{board['31']} #{board['32']} #{board['33']}"
			puts
			if board['11'] == '[o]' && board['12'] == '[o]' && board['13'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			if board['21'] == '[o]' && board['22'] == '[o]' && board['23'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			if board['31'] == '[o]' && board['32'] == '[o]' && board['33'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
       				exit
			end
			if board['11'] == '[o]' && board['21'] == '[o]' && board['31'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			if board['12'] == '[o]' && board['22'] == '[o]' && board['32'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			if board['13'] == '[o]' && board['23'] == '[o]' && board['33'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			if board['11'] == '[o]' && board['22'] == '[o]' && board['33'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			if board['13'] == '[o]' && board['22'] == '[o]' && board['31'] == '[o]'
        			puts "Вы проиграли! Ох, горе..."
        			exit
			end
			danger = { '11' => 0, '12' => 0, '13' => 0, '21' => 0, '22' => 0, '23' => 0, '31' => 0, '32' => 0, '33' => 0}
			dangerouscells = []
			maxdanger = 0
			puts "Снова ваш ход. Выберите клетку."
			freecells = freecells - 1
			if freecells == 0
   				puts "У вас ничья. Игра окончена."
        			exit
			end
	        else
			puts "Эта клетка уже занята. Выберите другую."
		end
	else
		puts "Такой клетки нет. Выберите ещё раз."
	end
end


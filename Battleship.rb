def welcome
  puts 'Welcome in Battleship
  instruction:
  * 3 boats, 2, 3 and 4 positions respectively were used.
  * They can be placed vertically and horizontally.

'

end

def check_position playerBoard, coord, vector, boats 
 
  if vector == 'h' || vector == 'H'
    index_m = coord[1]
    index = coord[0]
  end
  if vector == 'v' || vector == 'V'
    index_m = coord[0]
    index = coord[1]
  end

  max = index_m + boats - 1
  for i in index_m..max
    valor = (vector == 'h'? playerBoard[index][i] : playerBoard[i][index])
    if  valor != '[ ]'
      puts 'invalid coordinates'
      return false
    end
  end  
  puts 'valid coordinates'
  return true
end

def ask_coordinate player_name, boat_size
  sw = false
  while sw == false
  puts "#{player_name} enter coordinates boat size #{boat_size}, 
  the allowed format is 'row, column': "
  coord = gets.chomp.split(',')

  for i in 0..3  
    coord[i] = coord[i].to_i
  end 
  if coord[0] < 0 || coord[0] > 4 || coord[1] < 0 || coord[1] > 4
    puts "invalid coordinates"
    sw = false
  else
    sw = true
  end   
  end
  coord
end

def ask_orientation player_name, boat_size

  puts "#{player_name} Enter the orientation of boat size #{boat_size}, 
  the permitdo format is (H) for Horizontal or V for Vertical "
  vector = gets.chomp 
  vector
end

def init_board
  board = []
  for i in (0..3)
    board.push([])
    for j in (0..3)
      board[i][j] = '[ ]'
    end
  end
  board
end

def print_board board
  puts "  0  1  2  3"
  for i in 0..3
    print "#{i}"
    for j in 0..3
      print "#{board[i][j]}"
    end
    puts "\n"
  end
end

def init_boats board, player_name
  boats = [2,3,4]
  puts player_name
  for i in 0..boats.length - 1
    sw = false
    while sw == false 
      coord = ask_coordinate( player_name, boats[i])
      vector = ask_orientation(player_name, boats[i])
      sw = check_position(board, coord, vector, boats[i])
    end 
    mark_position(board, coord, vector, boats[i])
    print_board(board)
  end
end 

def mark_position playerBoard, coord, vector, boats

  if vector == 'h' || vector == 'H'
    vertical = coord[1]
    horizontal = coord[0]
    j = 0  
    for i in vertical..vertical + boats - 1
      playerBoard[horizontal][vertical + j] = "[#{boats}]"
      j = j + 1
     end 
  end
  if vector == 'v' || vector == 'V'
    horizontal = coord[0]
    vertical = coord[1]
    j = 0
    for i in horizontal..horizontal + boats - 1 
      playerBoard[horizontal + j][vertical] = "[#{boats}]"
      j = j + 1
    end
  end 
end

def init_attack player_name, boardattack
  attackPlayer = player_name 
  print_board(boardattack)
  return boardattack

end

=begin
def boardattack board
  puts "  0  1  2  3"
  for i in 0..3
    print "#{i}"
    for j in 0..3
      print "#{board[i][j]}"
    end
    puts "\n"
  end
  
end
=end


def attackPlayer boardattack, print_board, coord, player_board, 

  sw = check_winner 
  while true  
    boardattack(board)
    puts "#{player_name} es tu turno!"
    puts "Ingresa coordenadas (solo numeros): "
    coord = gets.chomp.split(',')
    y=coord[0]
    x=coord[1]
    for i in 0..3
      if player_board2[y][x] != "[ ]" 
        boardattack[y][x] = "[x]"
        puts "punto"
      elsif 
        boardattack[y][x] = "[a]"      
      end 
    end

    check_winner

    boardattack(board)
    puts "#{player_name} es tu turno!"
    puts "Ingresa coordenadas (solo numeros): "
    coord = gets.chomp.split(',')
    y=coord[0]
    x=coord[1]
    for i in 0..3
      if player_board[y][x] != "[ ]" 
        boardattack[y][x] = "[x]"
        puts "punto"
      elsif 
        boardattack[y][x] = "[/]"     
      end 
    end
    check_winner
  end
end
   
def game player1_name, player2_name, 
  
  player_board = init_board()
  init_boats(player_board, player1_name)

  player2_board = init_board()
  init_boats(player2_board, player2_name)

  attackPlayer = init_attack(attackPlayer, boardattack(board))
  init_attack attackPlayer, player1_name

  attackPlayer = init_attack(attackPlayer, boardattack(board))
  init_attack attackPlayer, player2_name

end

def check_winner attackPlayer,board_attack, player_name 
  cont = 0
  for i in 0..3
    attackPlayer [y]
    if attackPlayer [x]
      cont = cont  + 1
    end
  end

  if cont == 9
    puts "#{player_name} winner"
    exit   
  end
  sw = check_winner | attackPlayer
end

def main()

  welcome
  puts "Jugador 1 introduzca su nombre: "
  player1_name = gets.chomp

  puts "Jugador 2 introduzca su nombre: "
  player2_name = gets.chomp

  game(player1_name, player2_name)

end

main


 
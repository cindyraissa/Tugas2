load 'player.rb'
class MainMenu
  @@players = Array.new
  @@status = "new"
  
  def initialize
   puts "#================================================#"
   puts "#          Welcome to Battle Arena          #"
   puts "#-----------------------------------------#"
   puts "# Description :                         #"
   puts "# 1. ketik 'new' untuk membuat karakter #"
   puts "# 2. ketik 'start' untuk memulai pertarungan #"
   puts "#---------------------------------------#"
   puts "# *max player 2 atau 3             #"
   puts "#---------------------------------------#"
   
   get_user_input()
  end
  
  def get_user_input
    while !gameOver() do
      if @@status.eql? "new" and @@players.length < 3 then
        puts "pilih new/start: "
        input = gets.chomp
      else
        input = "start"
      end
      
      if input.eql? "new" then
        @@status = "new"
        
        puts "Input player name : "
        name = gets.chomp
        @@players.push Player.new name
      
      elsif input.eql? "start" then
        if @@players.length < 2 then
          puts "Minimal 2 Player to Play"
        else
          @@status = "play"
          
          puts "who is attack : "
          attackName = gets.chomp
          puts "who is being attacked : "
          targetName = gets.chomp
          
          if attackName.eql? targetName then
            puts "can't attack yourself!"
          else
            for player in @@players do
              if player.name.eql? attackName then
                player.attack()
              elsif player.name.eql? targetName then
                player.defense()
              end
              puts "#{player.name} : manna = #{player.manna}, blood = #{player.blood}"
              
            end
          end
        end
      else
        puts "Error Input"
      end
    end
    
    puts "Game Over"
  end
  
    def gameOver
      gameO = false
      
      for player in @@players do
        gameO = gameO || player.gameOver()
      end
      
      gameO     
    end
end

main = MainMenu.new


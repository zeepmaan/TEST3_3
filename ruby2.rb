@count = 0
@case_pattern =""

def janken
  if @count == 0
    puts "じゃんけん..."
  end
  
  puts "0(グー)1(チョキ)2(パー)3(戦わない)"

  select_number = gets.chomp
  randam_number = rand(3)
 
  if select_number != "0" && select_number != "1" && select_number != "2" && select_number != "3"
   puts "入力値が不正です。「０」か「1」か「2」か「３」を入力してください。"
   puts "------------------"
   return true
  end
  
  select_number2 = select_number.to_i

  if select_number2 == 3
   puts "戦わない"
   exit
  elsif @count == 0
   puts "ホイ！"
   @count = @count + 1
  else
   puts "ショ！"
  end

  myselect = ["グーをだしました","チョキをだしました","パーをだしました"]
  compselect = ["グーをだしました","チョキをだしました","パーをだしました"]

  puts "------------"
  puts "あなた :" + myselect[select_number2]
  puts "相手 :" + compselect[randam_number]
  puts "------------"
 
  if select_number2 == randam_number
   puts "あいこで"
   return true
  elsif (select_number2 == 0 && randam_number == 1) || (select_number2 == 1 && randam_number == 2) || (select_number2 == 2 && randam_number == 0)
   #puts "あなたの勝ち"
   @case_pattern = "パターンA"
   return false
  else
   #puts "あなたの負け"
   @case_pattern = "パターンB"
   return false 
  end
end

def acchimuitehoi
  puts "あっち向いて〜"
  puts "0(上)1(下)2(左)3(右)"
  
  select_number = gets.chomp
  ramdam_number= rand(4)
  
  if select_number != "0" && select_number != "1" && select_number != "2" && select_number != "3"
   puts "入力値が不正です。「０」か「1」か「2」か「３」を入力してください。"
   puts "------------------"
   return true
  end
  
  select_number2 = select_number.to_i
  
  myselect = ["上","下","左","右"]
  compselect =["上","下","左","右"]
  
  puts "ホイ！"
  puts "------------------"
  puts "あなた:" + myselect[select_number2]
  puts "相手:" + compselect[ramdam_number]
  puts "------------------"
  
  case @case_pattern
  when"パターンA"
    if select_number2 == ramdam_number
     puts "あなたの勝ち"
     return false
    else
     @game = true
     @count = 0
     @case_pattern =""
     return true
    end
  when"パターンB"
    if select_number2 == ramdam_number
     puts "あなたの負け"
     return false
    else
     @game = true
     @count = 0
     @case_pattern =""
     return true
    end
  end
end
  
@game = true
next_game = true

while next_game
  while @game  
  @game = janken
  end
  next_game = acchimuitehoi
end


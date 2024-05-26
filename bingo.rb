# Rubyの標準入力の受け取り方参考URL
# https://zenn.dev/haruguchi/articles/ruby-competitive-programming-io

# 縦、横を調べていき、trueのときはtrue_countに+1足していく。
# true_countがビンゴのマス目数と同じになったときBINGOとする。


# ビンゴカードのマス数
bingo_size = gets.to_i
board = Array.new(bingo_size) { gets.chomp.split }
# board => [["ruby", "java", "kotlin"], ["go", "rust", "php"]]

# ビンゴの答え
answer = gets.to_i
answers = Array.new(answer) { gets.chomp }
# answers => ["ruby", "go", "react", "php"]

# ビンゴの判定
bingo = false

# 横のビンゴだけ調べる
board.each do |words|
  true_count = 0
  words.each do |word|
    if answers.include?(word)
      true_count += 1
    else
      break
    end
  end

  if true_count == bingo_size
    bingo = true
    break
  end
end


# 縦のビンゴを調べる
unless bingo
  bingo_size.times do |index|
    true_count = 0
    board.each do |words|
      if answers.include?(words[index])
        true_count += 1
      else
        break
      end
    end

    if true_count == bingo_size
      bingo = true
      break
    end
  end

end

#　左上始まりの斜めを調べる
unless bingo
  true_count = 0
  board.each_with_index do |words, index|
    if answers.include?(words[index])
      true_count += 1
    else
      break
    end
  end

  if true_count == bingo_size
    bingo = true
  end
end

#　右上始まりの斜めを調べる
unless bingo
  true_count = 0
  board.each_with_index do |words, index|
    #ビンゴカードの右上は words[ビンゴのマス数-1]
    word_index = bingo_size - index - 1

    if answers.include?(words[word_index])
      true_count += 1
    else
      break
    end
  end

  if true_count == bingo_size
    bingo = true
  end
end

# 結果
puts bingo ? "yes" : "no"

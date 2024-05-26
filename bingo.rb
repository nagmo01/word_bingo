# ワードビンゴ
# Rubyの標準入力の受け取り方参考URL
# https://zenn.dev/haruguchi/articles/ruby-competitive-programming-io

# 設問の条件から外れる入力はない前提で解答して頂いて構いません。

# 入力
# S (マス数の縦横の数)
# A(1 1), A(1, 2), ...A(1, S)
# A(2, 1), A(2, 2), ...A(2, S)

# N (答えの単語数)
# W1
# W2
# ...
# WN
#
# AとWには実際には単語が入る
#
#
# SとNがなくてもできそうな気がしないでもない.lengthなどで
# 先に2次元配列？を作成して
# [[１行目のワード群], [２行目のワード群], [３行目のワード群]]
# [["tarou","jirou", "saburou"], ["erika", "marina", "shiori"], ["mac", "mos", "rotteria"]]
# みたいなのを作る方が良さそう。
# SとNが必要か理解した。単語だけだとAとWの境目が判別できないから
#
# Nの方に処理が移る
# ワードがあるかどうかは先に作った配列をincludeでできそう。
# ビンゴの条件は列、行、斜め
# 列はA1,1, A1,2, ...A1,Sが全てtrue
# 行はA1,1, A2,1, ...AS,1が全てtrue
# 斜めは具体的にいうとA1,1 A2,2 ... AS,Sが全部true
# パフォーマンスの部分はeach文を例えばfalseになったらすぐbreakするみたいなやり方でマシにはなりそう。
# trueになった瞬間breakしてprint("yes")
# 標準入力の受け取り方がよくわからない
# 数字
# get chomp
#
#





s = gets.to_i
words = Array.new(s) { gets.chomp.split }
a = gets.to_i
answers = Array.new(a) { gets.chomp }



bingo = false

# 横のビンゴだけ調べる
words.each do |word|
  bingo_count = 0
  word.each do |w|
    if answers.include?(w)
      bingo_count += 1
    else
      break
    end
  end

  if bingo_count == s
    bingo = true
    break
  end
end


# 縦のビンゴを調べる
unless bingo
  s.times do |index|
    bingo_count = 0
    words.each do |word|
      if answers.include?(word[index])
        bingo_count += 1
      else
        break
      end
    end

    if bingo_count == s
      bingo = true
      break
    end
  end

end

#　左上始まりの斜めを調べる
unless bingo
  bingo_count = 0
  words.each_with_index do |word, index|
    if answers.include?(word[index])
      bingo_count += 1
    else
      break
    end
  end

  if bingo_count == s
    bingo = true
  end
end

#　右上始まりの斜めを調べる
unless bingo
  bingo_count = 0
  words.each_with_index do |word, index|
    word_index = s - index - 1

    if answers.include?(word[word_index])
      bingo_count += 1
    else
      break
    end
  end

  if bingo_count == s
    bingo = true
  end
end


if bingo
  puts "yes"
else
  puts "no"
end

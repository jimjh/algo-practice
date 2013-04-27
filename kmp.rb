#!/usr/bin/env ruby
# ~*~ encoding: utf-8 ~*~
require 'pry'

module KMP

  # precompute memo
  def precompute(pattern)
    memo, j = [0], 0
    for i in 1..(pattern.length-1)
      j = memo[j-1] while(j > 0 and pattern[i] != pattern[j])
      j += 1 if pattern[i] == pattern[j] # else j must be 0
      memo[i] = j
    end
    memo
  end

  # calculate match
  def match(pattern, text)
    memo, j, results = precompute(pattern), 0, []
    text.each_char.with_index do |c, i|
      j = memo[j-1] while j > 0 and text[i] != pattern[j]
      j += 1 if text[i] == pattern[j] # else j must be 0
      if j == pattern.length
        results << (i - j + 1)
        j = memo[j-1] # continue at longest prefix match
      end
    end
    results
  end

end

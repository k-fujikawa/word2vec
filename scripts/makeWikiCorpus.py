# coding: utf-8
import sys, MeCab

output = open("../data/corpus/jawiki-parsed", "w")
input = open("test")
line = input.readline()
tagger = MeCab.Tagger()

stopwords = ["*"]


while line:
	node = tagger.parseToNode(line)
	words = ""
	while node:
		#  単語の原型が登録されている場合は、原型を利用。それ以外の場合は基の単語を利用する。
		if node.feature.split(',')[6] == "*":
			word = node.surface
		else:
			word = node.feature.split(',')[6]
		#  ストップワードでなければwordsへ追加
		if (word in stopwords) != True:
			words += word + ' '
		node = node.next
	output.write(words)
	line = input.readline()
	

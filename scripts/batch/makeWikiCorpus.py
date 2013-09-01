# coding: utf-8
import sys, MeCab
sys.path.append('/home/fujikawa/lib/python')
import utils

output = open("../../data/corpus/jawiki", "w")
input = open("../../data/corpus/jawiki-latest-pages-articles.txt")
lines = input.readlines()
tagger = MeCab.Tagger()

stopwords = ["*"]

i = 0
for line in lines:
	i += 1
	utils.Progress.print_progress(i, len(lines))
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
	

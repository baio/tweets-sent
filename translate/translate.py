#!/usr/bin/python

__author__ = 'max'

import codecs
import goslate

gs = goslate.Goslate()

i = 0

with codecs.open("data/clean-tweets-en.txt", "w", "utf-8") as w:
    with open("data/clean-tweets.txt") as f:
        content = f.readlines()
        for line in content:
            #print line
            trans = gs.translate(line, 'en', 'ru')
            #print trans
            w.write(trans + "\n")

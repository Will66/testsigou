#!/usr/bin/env python

def readFile2Dict(fileName, dictName):
  fileHandle = open(fileName,"r")
  line = fileHandle.readline().rstrip('\n')  
  dictName = {} 
  keycounter = 1 

  while line: 
    key = str(keycounter) 
    dictName[key] = line 
    keycounter = keycounter + 1 
    line = fileHandle.readline().rstrip('\n') 
  return dictName

res = {}
res = readFile2Dict("rank.txt",res)

print res
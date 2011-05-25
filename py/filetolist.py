#!/usr/bin/env python

def readFile2List(fileName, listName):
  listName = [] 
  with open(fileName,"r") as f: 
    sentences = [elem for elem in f.read().split('\n') if elem] 
  for word in sentences: 
    listName.append(word.split())
  return listName
  
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

comm=[]
comm=readFile2List("comm.txt",comm)

print comm
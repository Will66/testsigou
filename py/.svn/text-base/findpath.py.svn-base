from igraph import *

def adjlist_find_paths(a, n, m, path=[]):
  "Find paths from node index n to m using adjacency list a."
  path = path + [n]
  
  if n == m:
    return [path]
  paths = []
  
  for child in a[n]:
    if child not in path:
      child_paths = adjlist_find_paths(a, child, m, path)
      for child_path in child_paths:
        paths.append(child_path)
  return paths

def paths_from_to(graph, source, dest):
  "Find paths in graph from vertex source to vertex dest."
  a = graph.get_adjlist()
  n = source.index
  m = dest.index
  return adjlist_find_paths(a, n, m)
  
g = Graph.Read_Pajek("/home/amc/Desktop/wsanalysis/net/camx.net")
print g
layout = g.layout("kk")
plot(g,layout=layout)
#adjlist_find_paths(g,1,10)
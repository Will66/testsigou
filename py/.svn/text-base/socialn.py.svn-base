import igraph

def igraph2sonia(graph, soniaFile):
    '''
    Generate a Sonia .son file from an igraph Graph object
    based on "time" attributes on each vertex.  Handles color
    for nodes and edges if specified.
    '''
    # Initialize node section
    nodeSection = "NodeId\tStartTime\tEndTime\tColorName\tNodeSize\tBorderWidth\n"
    
    # Initialize edge section
    edgeSection = "FromId\tToId\tStartTime\tEndTime\tArcWidth\n"
    
    # Calculate the final time T
    times = []
    try:
        for v in graph.vs:
            try:
                times.extend(v["time"])
            except:
                times.append(v["time"])
    except Exception, E:
        print E
        raise Exception("igraph2sonia: all vertices must have a 'time' attribute")
        
    T = max(times)
    
    # We need to store these for the edge section later.
    nodeTimes = []
    
    # Generate the node section
    for i,v in enumerate(graph.vs):
        ''' If the time attribute isn't a scalar, assume it is of the form
        (startTime, endTime); otherwise, assume the given value is the time
        of introduction and the end time is the final graph time T.'''
        try:
            startTime = v["time"][0]
            endTime = v["time"][1]
        except:
            startTime = v["time"]
            endTime = T

        # Again, we need this for quick lookups in the edge section.
        nodeTimes.append((startTime,endTime))

        # If a color is given, use it.
        if "color" in v.attribute_names():
            color = v["color"]
        else:
            color = "black"
        
        # If a size is given, use it.
        if "size" in v.attribute_names():
            size = v["size"]
        else:
            size = 1
        
        # Append the resulting entry to the node section
        dataTuple = (i+1, startTime, endTime, color, size, 0)
        nodeSection += "\t".join(map(str, dataTuple)) + "\n"    

    # Get the edge list for lookups
    edgelist = graph.get_edgelist()
    
    # Now, generate the edge section.
    for i,e in enumerate(graph.es):
        # This is the current edge tuple.
        edge = edgelist[i]
        # The edge cannot exist before max_i(startTime).
        startTime = max(nodeTimes[edge[0]][0], nodeTimes[edge[1]][0])
        # The edge cannot exist after min_i(endTime).
        endTime = max(nodeTimes[edge[0]][1], nodeTimes[edge[1]][1])
        
        # If an arc width is given, use it.
        if "width" in v.attribute_names():
            width = e["width"]
        else:
            width = 1

        # Append the resulting entry to the edge section.
        dataTuple = (edge[0]+1, edge[1]+1, startTime, endTime, width)
        edgeSection += "\t".join(map(str, dataTuple)) + "\n"
    
    # Write the SONIA file.
    outfile = open(soniaFile, 'w')
    outfile.write("//igraph2sonia.py\n")
    outfile.write(nodeSection)
    outfile.write(edgeSection)
    outfile.close()
    

g = igraph.Graph.Lattice([20,20])
 
t = 0
for t,v in enumerate(g.vs):
    v["time"] = t
 
igraph2sonia(g, 'example1.son')
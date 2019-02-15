# Variables globales
tam_cuadcula_porDefecto=5

# Transforma coordenadas de matriz cartesianas en nodo. La casilla 1 se corresponde con las coordenadas (0,0)
def number(row,col,nrows):
    return col+row*nrows+1

# Comprueba si una casilla, dada por coordenadas (empezando a contar en 0) es una casilla valida
#   Si se llama esta funcion con solo 2 argumentos (row y col), se toma por defecto el valor tam_cuadricula_porDefecto. 
#   Si se llama con 3 argumentos, se utilizara el valor especificado.
def _es_casilla_valida(row,col,tam_cuadricula = tam_cuadricula_porDefecto):
 
    if col > tam_cuadricula-1 or row > tam_cuadricula-1:
        return false
    if col < 0 or row < 0:
        return false
    return true
    
# Devuelve la lista con las casillas a las que uno puede moverse desde una casilla dada por coordenadas (row y col).
def generar_movimientos(row,col,tam_cuadricula = tam_cuadricula_porDefecto):
    movimientos=[]
    for a in [-3,3]:
        if _es_casilla_valida(row+a,col,tam_cuadricula):
            movimientos.append(number(row+a,col,tam_cuadricula))
        if _es_casilla_valida(row,col+a,tam_cuadricula):
            movimientos.append(number(row,col+a,tam_cuadricula))
    for a in [-2,+2]:
        if _es_casilla_valida(row+a,col+a,tam_cuadricula):
            movimientos.append(number(row+a,col+a,tam_cuadricula))
        if _es_casilla_valida(row+a,col-a,tam_cuadricula):
            movimientos.append(number(row+a,col-a,tam_cuadricula))
    return movimientos
    
# Devuelve todos los caminos hamiltonianos dado un grafo.
# Fuente: https://stackoverflow.com/questions/5766160/enumerate-all-hamiltonian-paths
def hamiltonians(G, vis = []):
    if not vis:
        for n in G:
            for p in hamiltonians(G, [n]):
                yield p
    else:
        dests = set(G[vis[-1]]) - set(vis)
        if not dests and len(vis) == len(G):
            yield vis
        for n in dests:
            for p in hamiltonians(G, vis + [n]):
                yield p


tam_cuadricula_porDefecto=5

B=Graph()
for row in range(tam_cuadricula_porDefecto):
    for col in range(tam_cuadricula_porDefecto):
        for node in generar_movimientos(row,col,tam_cuadricula_porDefecto):
            B.add_edge([number(row,col,tam_cuadricula_porDefecto),node])


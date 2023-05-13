module linked_list
//fila aponta para um nodo root 
sig Queue { root: lone Node}
//nodo aponta para um nodo
sig Node {next: lone Node}
/// nao exite nodo em que ele é o seu proximo self poitng
fact nextNotReflexive { no n:Node | n = n.next }

// todos os nodos, tem que estar dentro de uma fila
fact NoIsolatedNodes {
  all n: Node | n in Queue.root.*next
}

//nao exite fila sem nodos
fact noQueueWithNoNodes{no Q:Queue | Q.root=none} 

//para todos os nodos n existem algumas filas no qual cada nodo pertence a q.root.:w*next q.root q.root.next
//q.root.next.next
//fact allNodesBelongToSomeQueue {
	//	all n:Node | some q:Queue | n in q.root.*next
	//}

//nao deixa ciclico 
fact nextNotCyclic { no n:Node | n in n.^next }

//agora todos os nodos pertencem a uma fila
//todos os nodes tem uma so fila, de forma que todo nodo exitem em q.root.*next
//faz todos os matches
fact allNodesBelongToOneQueue {
		all n:Node | one q:Queue | n in q.root.*next
	}


pred show(){}

run show for 6

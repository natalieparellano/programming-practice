countInNetwork = 5; // npa: Network object to manage

var A = new Computer( "A", 1 );
var B = new Computer( "B", 1 );
var C = new Computer( "C", 2 );
var D = new Computer( "D", 4 );
var E = new Computer( "E", 18 );

A.neighbors = [B, C];
B.neighbors = [A, C, D];
C.neighbors = [A, B, E];
D.neighbors = [B];
E.neighbors = [C];

A.broadcast();

setTimeout( function () {
	A.getNetworkMax();
}, 5000 );

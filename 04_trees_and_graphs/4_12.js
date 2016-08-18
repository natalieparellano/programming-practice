function Node ( val, children ) {
  this.val = val;
  this.children = children;
}

var H = new Node( 0, null );
var I = new Node( 2, null );
var D = new Node( 1, [H, I] );
var E = new Node( 4, null );
var F = new Node( 2, null );
var G = new Node( 3, null );
var B = new Node( 2, [D, E] );
var C = new Node( -1, [F, G] );
var A = new Node( 3, [B, C] );

var rootNode = A;
var target = 4;

var foundPaths = [];

function findPaths( currentNode, currentPath ) {
  // console.log( "Current node is: " + currentNode.val );
  // console.log( "Current path is..." );
  // printPath( currentPath );

  testSubPaths( currentPath );

  if ( !currentNode.children ) {
    return;
  }

  for ( var i = 0; i < currentNode.children.length; i++ ) { // npa: var IS not necessary...be very careful!!!
    var child = currentNode.children[i];
    // console.log( "Child is: " + child.val );
    var nextPath = currentPath.slice( 0 ); // make a shallow copy... npa: watchout (return value)
    nextPath.push( child );
    // console.log( "Next path is..." ); 
    // printPath( nextPath );
    findPaths( child, nextPath );
  }  
}

function testSubPaths( path ) {
  var lastIndex = path.length - 1;
  for ( var i = 0; i < path.length; i++ ) { // npa: watchout
    var subPath = path.slice( i, lastIndex + 1 ); // npa: watchout
    // console.log( "Subpath is..." );
    // printPath( subPath );
    testPath( subPath );
  }
}

function testPath( path ) {
  var sum = path.reduce( function( acc, el ) {
    return acc + el.val;
  }, 0 ); // npa: watchout
  // console.log( "Sum is: " + sum );

  if ( sum === target ) {
    foundPaths.push( path );
  }  
}

function printPath( path ) {  
  vals = path.map( function( el ) { // npa: watchout (use .map() not .reduce())
    return el.val;
  });
  console.log( vals );
}

findPaths( A, [A] );

console.log( "Done!" );
console.log( "Found paths are..." );
foundPaths.forEach( function( path ) {
  printPath( path );
});
// some mapping between the labels and their ordinal rank

var label       = 14;
var level       = Math.floor( Math.log2( label ));
var level_size  = Math.pow( 2, level );
var local_index = label - level_size;

function findPath( level_size, index, path ) {
  if ( level_size === 1 ) {
    
    return path; // npa: watchout...this only returns to the last findPath on the stack 

  } else if ( index >= ( level_size / 2 )) {

    path.push( "Go right" );
    return findPath(( level_size / 2 ), ( index - ( level_size / 2 )), path );

  } else {

    path.push( "Go left" );
    return findPath(( level_size / 2 ), index, path );

  }    
}

var answer = findPath( level_size, local_index, [] );

console.log( "answer is " + answer );

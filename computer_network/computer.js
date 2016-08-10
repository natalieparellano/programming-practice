function Computer ( name, val, neighbors ) {
  this.name = name;
  this.val = val;
  this.heardFrom = [];
  this.neighbors = neighbors || []; // an array 
  this.queue = [];
}

function myMerge ( arr1, arr2 ) {
  var finalArr = [];
  for ( i = 0; i < arr1.length; i++ ) {
    if ( !finalArr.includes( arr1[i] )) {
      finalArr.push( arr1[i] );
    }
  }
  for ( i = 0; i < arr2.length; i++ ) {
    if ( !finalArr.includes( arr2[i] )) {
      finalArr.push( arr2[i] );
    }
  }
  // console.log( "arr1 is " + JSON.stringify( arr1 ));
  // console.log( "arr2 is " + JSON.stringify( arr2 ));
  // console.log( "finalArr is " + JSON.stringify( finalArr ));
  return finalArr;
}

Computer.prototype.broadcast = function () {
  var msg = { val: this.val, from: this.name, heardFrom: this.heardFrom };
  for ( var i = 0; i < this.neighbors.length; i++ ) {
    // neighbors[i].queue.push( msg );
    this.neighbors[i].processMessage( msg );    
  }
}

Computer.prototype.processMessage = function ( msg ) {
  console.log( this.name + " received msg: " + JSON.stringify( msg ));
  var self = this;
  self.queue.push( msg );
  setTimeout( function () {    
    self.update();
  }, Math.random() * 5000 ); // npa: random value
}

Computer.prototype.update = function () {
  if ( this.fullyUpdated() ) {
    return;
  }

  console.log( this.name + " has queue " + JSON.stringify( this.queue ));

  var self = this; // npa: watchout
  this.queue.forEach( function( msg ) {
    self.val = Math.max( self.val, msg.val );
    self.heardFrom = myMerge( self.heardFrom, msg.heardFrom );
    self.heardFrom = myMerge( self.heardFrom, [msg.from] );
  });  
    
  console.log( "New max is " + this.val );

  this.queue = [];  
  this.broadcast();
}

Computer.prototype.fullyUpdated = function () {
  return ( this.heardFrom.length === countInNetwork );
}

Computer.prototype.getNetworkMax = function () {
  if ( this.fullyUpdated() ) {
    console.log( "Max value is " + this.val );
  } else {
    console.log( "Not fully updated - call .broadcast() if not done already!" );    
  }
}
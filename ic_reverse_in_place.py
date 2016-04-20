message = ['c','a','t',' ','a',' ','i','s',' ','t','h','i','s']

def reverse_words( message ):
  msg_length = len( message )
  current_offset = 1
  next_offset = 1
  pointer = 0
  keep_going = True 
  while keep_going:
    # peak ahead to the next space
    while message[pointer] != ' ':
      pointer += 1
    if pointer < msg_length - current_offset: # check if we've done all the words
      # insert the word at the current offset 
      for i in range( 0, pointer ):
        el = message.pop( 0 )
        print "inserting at offset " + str( current_offset )
        message.insert(( msg_length - current_offset ), el )
        print "message is now " + str( message )
        next_offset += 1
      # insert the space at the next offset 
      el = message.pop( 0 )
      print "inserting at offset " + str( next_offset )
      message.insert(( msg_length - next_offset ), el )
      print "message is now " + str( message )
      next_offset += 1
      current_offset = next_offset
      # reset the pointer 
      pointer = 0
    else:
      keep_going = False

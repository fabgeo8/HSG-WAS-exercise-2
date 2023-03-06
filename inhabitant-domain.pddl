(define (domain inhabitant-rooms-domain)
  (:requirements :strips :typing)
  (:types inhabitant room time - object)
  (:predicates ( ?roomShown - inhabitant)
	       )
  (:action show-room
	     :precondition (and (clear ?x) (ontable ?x) (handempty))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x)))
		   
		   
    (:action show-room
    	    :parameters (?inhabitant - inhabitant ?time - time ?room - room)
    	    :precondition (and (time ?r)
    			(not roomShown)
    		)
    	    :effect (roomShown ?r)
        )
(define (domain roominhab-domain)
    (:requirements :typing)
    (:types
        time - object
        inhabitant - object
        room - object
    )
    (:predicates
        (timeSlotOccupied ?time - time)
        (roomUnlocked ?room - room)
        (roomOccupied ?room - room)
        (hasRoom ?inhab - inhabitant)
        (canArrive ?time - time ?inhab - inhabitant ?room - room)
        (at ?room - room)
    )
    (:action showRoom
        :parameters (?room - room ?inhab - inhabitant ?time - time)
        :precondition (and
            (canArrive ?time ?inhab ?room)
            (not (timeSlotOccupied ?time))
            (at ?room)
            (roomUnlocked ?room)
            (not (roomOccupied ?room))
            (not (hasRoom ?inhab))
        )
        :effect (and
            (timeSlotOccupied ?time)
            (roomOccupied ?room)
            (hasRoom ?inhab)
        )
    )
    (:action unlockRoom
        :parameters (?room - room)
        :precondition (at ?room)
        :effect (roomUnlocked ?room)
    )
    (:action move
        :parameters(?room1 - room ?room2 - room)
        :precondition(at ?room1)
        :effect (and
            (at ?room2)
            (not (at ?room1))
        )
    )
)
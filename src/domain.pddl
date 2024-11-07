(define (domain robot-chef)

    (:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

    (:types 
        room - object
        portable - object
        robot - portable
        item - portable
        ingredient dish tool - item
    )

    (:predicates 
        ; Basic predicates
        (at ?x - portable ?y - room) ; we unite the tool-at, ingredient-at and robot-at predicates into one
        (prepared ?dish -dish)
        (served ?dish - dish); The dish is served
        (clean ?tool - tool)
        (holding ?x - item)
        (not-holding)
        (adjacent ?room1 - room ?room2 - room)

        (dish-prepared ?dish - dish)
        (dish-served ?dish - dish)

        ; for the real-time question: 
        ; we could add something like this: (prioritize ?dish1 ?dish2) 
        ; meaning that dish1 has higher priority than dish2.

        ; More predicates

        ; To check the function of a room
        (is-storage ?room - room)
        (is-cooking ?room - room)
        (is-serving ?room - room)
        (is-preparation ?room - room)
        (is-dishwashing ?room - room)
        (is-cutting ?room - room)
        (is-mixing ?room - room)

        (tool-use-room ?tool - tool ?room - room)
        (ingredient-prep-room ?ingredient - ingredient ?room - room)

    )
    (:action pick-up
        :parameters (?robot - robot ?item - item ?room - room)
        :precondition (and 
            (at ?robot ?room)
            (at ?item ?room)
            (not-holding)
        )
        :effect (and 
            (holding ?item)
            (not (at ?item ?room))
            (not (not-holding))
        )
    )

    (:action move
        :parameters (?robot - robot ?from - room ?to - room)
        :precondition (and 
            (at ?robot ?from)
            (adjacent ?from ?to)
        )
        :effect (and 
            (at ?robot ?to)
            (not (at ?robot ?from))
        )
    )

    (:action clean-tool
        :parameters (?robot - robot ?tool - tool ?room - room)
        :precondition (and 
            (at ?robot ?room)
            (is-dishwashing ?room)
            (holding ?tool)
            (not (clean ?tool))
        )
        :effect (and 
            (clean ?tool)
        )
    )
    
    



)
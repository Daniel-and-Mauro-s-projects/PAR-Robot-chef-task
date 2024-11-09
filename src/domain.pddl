(define (domain robot-chef)

   (:requirements :strips :typing :negative-preconditions :disjunctive-preconditions :conditional-effects :universal-preconditions)
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

        (tool-use-room ?tool - tool ?room - room)
        (ingredient-prep-room ?ingredient - ingredient ?room - room)

        (ingredient-stored ?ingredient - ingredient)
        (ingredient-available ?ingredient - ingredient)
        (ingredient-prepared ?ingredient - ingredient)
        (ingredient-cooked ?ingredient - ingredient)

        ; define recipe
        (ingredient-in-dish ?ingredient - ingredient ?dish - dish)
        (require-prepared ?dish - dish ?ingredient - ingredient)
        (require-cooked ?dish - dish ?ingredient - ingredient)

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
(:action pick-up-ingredient
    :parameters (?robot - robot ?ingredient - ingredient ?dish - dish ?room - room)
    :precondition (and
        (at ?robot ?room)
        (is-storage ?room)
        (ingredient-stored ?ingredient)
        (not-holding)
        (ingredient-in-dish ?ingredient ?dish)
    )
    :effect (and
        (holding ?ingredient)
        (ingredient-available ?ingredient)
        (not (not-holding))
        (not (ingredient-stored ?ingredient))
    )
)

(:action prepare-ingredient
    :parameters (?robot - robot ?ingredient - ingredient ?tool -tool ?room - room)
    :precondition (and
        (at ?robot ?room)
        (ingredient-prep-room ?ingredient ?room)
        (at ?ingredient ?room)
        (holding ?tool)
        (tool-use-room ?tool ?room)
        (clean ?tool)
    )
    :effect (and
        (ingredient-prepared ?ingredient)
        (not (clean ?tool))
    )
)
(:action cook-ingredient
    :parameters (?robot - robot ?ingredient - ingredient ?room - room)
    :precondition (and
        (is-cooking ?room)
        (at ?robot ?room)
        (ingredient-prepared ?ingredient)
        (holding ?ingredient)
    )
    :effect (and
        (ingredient-cooked ?ingredient)
    )
)
(:action assemble-dish
    :parameters (?robot - robot ?dish - dish ?room - room)
    :precondition (and
        (at ?robot ?room)
        (is-preparation ?room)
        (forall
            (?ingredient - ingredient)
            (and
                (imply
                    (and (ingredient-in-dish ?ingredient ?dish) (require-prepared ?dish ?ingredient))
                    (and (ingredient-prepared ?ingredient) (at ?ingredient ?room)))
                (imply
                    (and (ingredient-in-dish ?ingredient ?dish) (require-cooked ?dish ?ingredient))
                    (and (ingredient-cooked ?ingredient) (at ?ingredient ?room)))
            )
        )
    )
    :effect (and
        (dish-prepared ?dish)
        (at ?dish ?room)
            (forall
                (?ingredient - ingredient)
                (when
                    (ingredient-in-dish ?ingredient ?dish)
                    (and
                        (not (ingredient-available ?ingredient))
                        (not (at ?ingredient ?room))
                        (not (ingredient-cooked ?ingredient))
                        (not (ingredient-prepared ?ingredient))
                    )
                )
            )
        )
)
(:action plate-dish
    :parameters (?robot - robot ?room - room ?dish - dish)
    :precondition (and
        (is-serving ?room)
        (at ?robot ?room)
        (holding ?dish)
        (dish-prepared ?dish)
    )
    :effect (and
        (dish-served ?dish)
        (not (holding ?dish))
        (not-holding)
    )
)
(:action drop-tool
        :parameters (?robot - robot ?tool - tool ?room - room)
        :precondition (and
            (at ?robot ?room)
            (holding ?tool)
            (tool-use-room ?tool ?room)
        )
        :effect (and
            (not (holding ?tool))
            (not-holding)
            (at ?tool ?room)
        )   
    )
(:action drop-ingredient-at-prep
    :parameters (?robot - robot ?ingredient - ingredient ?room - room)
    :precondition (and
        (at ?robot ?room)
        (holding ?ingredient)
        (or
            (ingredient-prep-room ?ingredient ?room)
            (is-preparation ?room)
        )
    )
    :effect (and
        (not (holding ?ingredient))
        (not-holding)
        (at ?ingredient ?room)
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
(define (problem basic) 
    (:domain robot-chef)
    (:objects 
        storage-room preparation-room cooking-room serving-room dishwashing-room cutting-room mixing-room - room
        sushi - dish 
        knife spatula - tool
        rice fish vegetable - ingredient
        chef - robot
    )

    (:init
        (at chef cooking-room)

        (ingredient-stored fish)
        (ingredient-stored rice)
        (ingredient-stored vegetable)

        (ingredient-prep-room rice mixing-room)
        (ingredient-prep-room fish cutting-room)
        (ingredient-prep-room vegetable cutting-room)

        ; recipe
        (ingredient-in-dish rice sushi)
        (ingredient-in-dish fish sushi)
        (ingredient-in-dish vegetable sushi)

        (require-prepared sushi vegetable)
        (require-prepared sushi fish)
        (require-cooked sushi rice)

        (tool-use-room knife cutting-room)
        (tool-use-room spatula mixing-room)
        (at knife cutting-room)
        (at spatula mixing-room)
        (clean knife)
        (clean spatula)

        (not-holding)

        (is-storage storage-room)
        (is-preparation preparation-room)
        (is-cooking cooking-room)
        (is-serving serving-room)
        (is-dishwashing dishwashing-room)

        (adjacent serving-room cooking-room)
        (adjacent cooking-room serving-room)
        (adjacent cooking-room dishwashing-room)
        (adjacent dishwashing-room cooking-room)
        (adjacent preparation-room dishwashing-room)
        (adjacent dishwashing-room preparation-room)
        (adjacent preparation-room cooking-room)
        (adjacent cooking-room preparation-room)
        (adjacent mixing-room preparation-room)
        (adjacent preparation-room mixing-room)
        (adjacent mixing-room cutting-room)
        (adjacent cutting-room mixing-room)
        (adjacent storage-room mixing-room)
        (adjacent mixing-room storage-room)
        (adjacent cutting-room storage-room)
        (adjacent storage-room cutting-room)
    )

    (:goal (and
        (dish-served sushi)
        (at chef serving-room)
        (at knife cutting-room)
        (at spatula mixing-room)
        (clean knife)
        (clean spatula)
    ))

)

(define (problem basic) 
    (:domain robot-chef)
    (:objects 
        storage-room preparation-room cooking-room serving-room dishwashing-room cutting-room mixing-room - room
        ; Dishes:
        sushi - dish 
        paella -dish
        ; Tools:
        knife spatula - tool
        ; Ingredients:
        rice fish vegetable shrimps - ingredient
        rice1 fish1 vegetable1 - ingredient
        ; Robot:
        chef - robot
    )

    (:init
        (at chef cooking-room)

        (ingredient-stored fish1)
        (ingredient-stored rice1)
        (ingredient-stored vegetable1)

        (ingredient-stored fish)
        (ingredient-stored rice)
        (ingredient-stored vegetable)
        (ingredient-stored shrimps)
        
        (ingredient-prep-room rice1 mixing-room)
        (ingredient-prep-room fish1 cutting-room)
        (ingredient-prep-room vegetable1 cutting-room)

        (ingredient-prep-room rice mixing-room)
        (ingredient-prep-room fish cutting-room)
        (ingredient-prep-room vegetable cutting-room)
        (ingredient-prep-room shrimps cutting-room)

        ; sushi recipe
        (ingredient-in-dish rice1 sushi)
        (ingredient-in-dish fish1 sushi)
        (ingredient-in-dish vegetable1 sushi)


        (require-prepared sushi vegetable1)
        (require-prepared sushi fish1)
        (require-cooked sushi rice1)

        ; paella recipe
        (ingredient-in-dish rice paella)
        (ingredient-in-dish vegetable paella)
        (ingredient-in-dish shrimps paella)
        (ingredient-in-dish fish paella)

        (require-cooked paella shrimps)
        (require-cooked paella rice)
        (require-cooked paella vegetable)
        (require-cooked paella fish)

        ; Tools
        (tool-use-room knife cutting-room)
        (tool-use-room spatula mixing-room)

        ; the knife is out place and the spatula isn't clean
        (at knife cooking-room)
        (at spatula mixing-room)
        (clean knife)
        ;(clean spatula)

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
        (dish-served paella)
        (at chef serving-room)
        (at knife cutting-room)
        (at spatula mixing-room)
        (clean knife)
        (clean spatula)
    ))

)
(define (problem basic) 
    (:domain robot-chef)
    (:objects 
        storage-room preparation-room cooking-room serving-room dishwashing-room cutting-room mixing-room - room
        ; Dishes:
        sushi - dish 
        tortilla - dish
        paella - dish
        ; Tools:
        knife spatula - tool
        ; Ingredients:
        eggs onions potatoes - ingredient
        rice fish vegetable - ingredient
        rice1 fish1 vegetable1 shrimps - ingredient
        ; Robot:
        chef - robot
    )

    (:init
        (at chef dishwashing-room)

        (ingredient-stored fish)
        (ingredient-stored rice)
        (ingredient-stored vegetable)

        (ingredient-stored fish1)
        (ingredient-stored rice1)
        (ingredient-stored vegetable1)
        (ingredient-stored shrimps)

        (ingredient-stored onions)
        (ingredient-stored eggs)
        (ingredient-stored potatoes)
        
        (ingredient-prep-room rice mixing-room)
        (ingredient-prep-room fish cutting-room)
        (ingredient-prep-room vegetable cutting-room)

        (ingredient-prep-room eggs mixing-room)
        (ingredient-prep-room potatoes cutting-room)
        (ingredient-prep-room onions cutting-room)

        (ingredient-prep-room rice1 mixing-room)
        (ingredient-prep-room fish1 cutting-room)
        (ingredient-prep-room vegetable1 cutting-room)
        (ingredient-prep-room shrimps cutting-room)

        ; sushi recipe
        (ingredient-in-dish rice sushi)
        (ingredient-in-dish fish sushi)
        (ingredient-in-dish vegetable sushi)


        (require-prepared sushi vegetable)
        (require-prepared sushi fish)
        (require-cooked sushi rice)

        ; tortilla recipe
        (ingredient-in-dish onions tortilla)
        (ingredient-in-dish eggs tortilla)
        (ingredient-in-dish potatoes tortilla)

        (require-cooked tortilla onions)
        (require-cooked tortilla eggs)
        (require-cooked tortilla potatoes)

        ; paella recipe
        (ingredient-in-dish rice1 paella)
        (ingredient-in-dish vegetable1 paella)
        (ingredient-in-dish shrimps paella)
        (ingredient-in-dish fish1 paella)

        (require-cooked paella shrimps)
        (require-cooked paella rice1)
        (require-cooked paella vegetable1)
        (require-cooked paella fish1)
    

        ; Tools
        (tool-use-room knife cutting-room)
        (tool-use-room spatula mixing-room)

        ; the knife and spatula are out place and both aren't clean
        (at knife serving-room)
        (at spatula serving-room)
        (not (clean knife))
        (not (clean spatula))

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
        (dish-served tortilla)
        (dish-served paella)
        (at chef serving-room)
        (at knife cutting-room)
        (at spatula mixing-room)
        (clean knife)
        (clean spatula)
    ))

)
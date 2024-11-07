# PAR Robot chef task

The code is still not complete yet. 
To be implemented: 
- Predicates: 
  - predicates for ingredients (and what state they are in: available, prepared, cooked?)
  - define the ingredients for a given dish (and also in what state are they needed in: prepared, cooked? )
- Actions: 
  - drop ingredient (to prep room)
  - prepare ingredient
  - cook ingredient
  - assemble dish
  - serve dish
- Add these to the problem.pddl


Other todo: 
- Integration with Real-Time Order Systems: Expanding on how the robot interfaces with the digital order system could clarify operational dynamics, especially how it handles order prioritization and scheduling in real-time.

For this, we could add a predicate (prioritize ?dish1 ?dish2)
    

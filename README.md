# PAR Robot chef task

The code is now running for the basic test case. 

TODO: 

Dani: [ ] Write introduction for the problem, discussing the predicates, actions

[ ] Invent and implement two test cases of increasing complexity

[ ] Perform the planning on the test cases and analyze the result (time, nodes expanded/generated)

[ ] Include the result (sequence of actions) in the report

[ ] If we don't have the time to implement the real-time and error handling, then at least comment our thoughts on that, saying what would we do (what predicates, actions to implement)

Other todo: 

[ ] Integration with Real-Time Order Systems: Expanding on how the robot interfaces with the digital order system could clarify operational dynamics, especially how it handles order prioritization and scheduling in real-time.
For this, we could add a predicate (prioritize ?dish1 ?dish2)

[ ] Missing ingredients or tools? 
Maybe include add-ingredient ?ingredient and add-tool ?tool actions if they are missing.

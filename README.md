# SBqM

## Implementing a system to monitor the queue of a bank, using **Verilog**.

Installing an embedded system to monitor the client queue in front of the tellers **[TellerCount, PeopleCount]**. The proposed system, called **SBqM™**, is to display various information about the status of the queue.

1) Both queue ends are equipped with a photocell called **[SenseIn, SenseOut]**. Each photocell generates a logic ‘1’ signal if nobody interrupts a light beam generated at the corresponding queue end. When the light beam is interrupted, the photocell output changes to logic ‘0’ and stays at that value until it is no longer interrupted.

2) Clients are supposed to enter the queue only from the back end and leaves only from the front end.

3) A responsible person should have the capability of resetting the system. Resetting the system clears the full flag and Pcount, and the sets empty flag.

4) Although random logic can be used in calculating Wtime, it was decided to use a look-up table to achieve a better runtime performance. The lookup table is to be realized as a ROM.

5) Although the system could be modeled as a one big FSM, it was decided to decompose the system into smaller FSMs. Design reuse is also recommended. That is, one small FSM model can be repeated multiple times in the overall system model.

6)Wait time **[WaitTime]**, in seconds, could approximately be given by the formulas:
    WaitTime (PeopleCount = 0) = 0,
    WaitTime (PeopleCount != 0,TellerCount) = 3*(PeopleCount + TellerCount - 1)/TellerCount
    TellerCount {1, 2, 3}.

PS: There is the project report and design architecture in the **SBqM_Report** PDF and the requirments in the **SBqM_Req** PDF.

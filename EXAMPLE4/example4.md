## Example 4: Stochastic SIS model 

In the next example we consider a model of infection transmission within a closed popluation (no births or deaths): the susceptible-infected-susceptible (SIS) model.

In this model we consider two types of event:
	Infection events, which occur in each time step with probability (β I dt)/N per susceptible individual, and
	Recovery events, which occur in each time step with a probability ν dt per infected individual.

The ODE representation of the model is:

dS/dt=-βSI/N+νI
dI/dt=βSI/N-νI

The analytical solution to this ODE can be shown to be:

I(t)=I^*  1/(1+(I⁄I_0 -1)expa(-(β-ν)t))

where I_0 is the initial number of infected individuals and Istar=N(1-ν⁄β). After sufficient time, the infection and recovery processes balance each other out. This occurs when the number of infectious individuals reaches its equilibrium value I^*. We can write the equilibrium value as

I^*= N (1-1⁄R_0 )

since R_0 is defined as β⁄ν. At this point, we say that the disease is endemic in the population.


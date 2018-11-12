## Example 1: Deterministic growth model 

This is a simple simulation of a birth process. Each individual has a birth rate (births per unit time), $r$. In a short time, $dt$, we would expect $r \times dt$ new births for each individual. Thus, in a population of size $N$ there will be $rNdt$ births. So the ODE equation for change in population size is 

$ \frac{dN}{dt}  = rN $

where $r$ is the growth rate per individual per unit time. The solution of this equation is exponential growth i.e. 

$ N(t) = N(0) e^{rt}$,

where $N(0)$ is the initial population at time $t = 0$. 

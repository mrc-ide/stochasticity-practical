## Example 2: Stochastic growth model 

In this example we extend the code developed in Example 1 to perform a stochastic simulation. For a stochastic simulation, the probability that an individual gives birth in a short time, dt, is given by r dt. The same probability applies to each of the N individuals. Hence the number of new births will be binomially distributed: 

births in time dt ~ Bin(rdt,N )

We can also perform multiple runs simultaneously in odin. This also allows us look at estimates of the mean over many runs and how that depends on the number of runs.

## Example 2: Stochastic growth model 

In this example we extend the code developed in Example 1 to perform a stochastic simulation. For a stochastic simulation, the probability that an individual gives birth in a short time, \(dt\), is given by \(r dt \). The same probability applies to each of the \( N \) individuals. Hence the number of new births will be binomially distributed: 

$$ \mbox{births in time } dt \sim Bin(N, rdt) $$

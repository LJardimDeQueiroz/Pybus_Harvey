
# How to plot the results:

## Simulating a tree:
require(TreeSim)

sim_tree <- sim.bd.taxa.age(n= 100, numbsim=1, lambda= 0.25, mu = 0, age = 10, mrca = TRUE, frac = 1)
tree <- sim_tree[[1]]
plot(tree)


## Running the function pybus_harvey:

test <- pybus_harvey(tree.hypostomus, n_sim = 1000)

test$gamma
test$p.value


## Plotting the results:
### When plot the simulated gamma values, make sure to adjust the range x-axis to allow plotting the gamma value you estimated for your tree.

hist(test$sim.gamma,  xlim=c(-4,4), xlab="Gamma Statistic", main=NULL)
abline(v = test$gamma, lty = 2, col = "red")
legend("topright", legend = "Observed gamma", col = "red", lty = 2, bty = 'n', cex = 0.75)



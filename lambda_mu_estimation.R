# A possible way to estimate values of speciation (lambda) and extinction (mu) of a given phylogenetic tree.

# Creating a random tree

require(TreeSim)

sim_tree <- sim.bd.taxa.age(n = 25, numbsim = 1, lambda = 0.25, mu = 0, age = 10, mrca = TRUE, frac = 1)
tree <- sim_tree[[1]]
plot(tree)


# Estimating speciation and extinction rates:

require(diversitree)

tree_bd <- make.bd(tree) 
pars_init <- c(0.5, 0.1) #Initial parameters for the optimisation
res <- find.mle(tree_bd, pars_init)
res$par

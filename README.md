# Pybus_Harvey

In macroevolutionary studies, one can ask if a certain lineage has diversified under a constant rate or not. One of the classical ways to test it is by calculating the Pybus-Harvey gamma statistic (Pybus and Harvey 2000).

Roughly, a negative gamma value indicate that inter-node distances between the root and the midpoint are shorter than the distances between the midpoint and the tips, and hence, most branching events occurred earlier in the evolutionary history of the clade. This kind of pattern can be recovered because the lineage might have experienced a decline in the rate of species accumulation over time, which can be consistent to an ‘early burst’ model of diversification. 

To test if the estimated gamma value of a phylogenetic tree is is lower or greater than expected, we can simulate values of gamma using the gammaStat function of the APE package in R (Paradis et al. 2004). It is recommended to simulate null distributions for the gamma statistic using the MCCR test (Pybus and Harvey 2000) to avoid bias towards negative values due to incomplete taxonomic sampling. Therefore, one can inform the fraction of the diversity of the given lineage is represented in the tree, and automatically the fraction that is missing.

Here there is a simple function in R that calculates and simulates Pybus-Harvey gamma statistic for a given tree.
The following libraries are required: APE and GEIGER. 

## Here is what you will neet to input in the function:

- tree: An ultrametric phylogenetic tree.
- lambda, mu: Values of speciation (lambda) and extinction (mu) rates. These values will be used for the simulations. Random, but realistic values can be used. Yet, it is recommended to estimate them based on your real tree so that you will get more reliable simulated gamma values. There are plenty of functions in R that can be used to estimate them. Here I suggest to use the diversitree package (FitzJohn 2012), and I included a few set of commands to get the values.
- n_taxa: Number of taxa present in the lineage. I recommend to use the number of taxa that is really known for the group instead of using the number of taxa represented in your phylogeny.
- n_taxa_drop: This is the number of taxa you want to drop to prune your simulated trees in order to make them identical to your original tree. If 'n_taxa' is equal to the number of taxa of your input tree, then 'n_taxa_drop' must be set to 0 (default).
- n_sim: that is the number of simulations to run. Default = 1000.
- tail_test: "one_tail" (default) or "two tail".

```
pybus_harvey (tree, lambda = 0.25, mu = 0, n_taxa = length(tree$tip.label), n_taxa_drop = 0, n_sim = 1000, tail_test = "one_tail")
```


See 'Plot_simulated_pybus_harvey.R' for an alternative way to plot the results.
See 'lambda_mu_estimation.R' for an alternative way to estimate lambda and mu.



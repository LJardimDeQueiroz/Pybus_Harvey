pybus_harvey <- function(tree, lambda = 0.25, mu = 0, n_taxa = length(tree$tip.label), n_taxa_drop = 0, n_sim = 1000, tail_test = "one_tail") {
	
	#Calculating gamma value:
	gamma <- gammaStat(tree)
		
	#Simulating gamma values:
	num_simulations <- n_sim
	gamma_null <- numeric(num_simulations)
	
	for(i in 1:num_simulations) {
		sim_tree <- sim.bdtree(b = lambda, d = mu, n = n_taxa) 
		prune <- drop.random(sim_tree, n_taxa_drop)
		gamma_null[i] = gammaStat(prune) 
	}
		
	#Returning p-value for the gamma test:
	if (tail_test == "one_tail"){
		p_value = 1 - pnorm(abs(gammaStat(tree.hypostomus)))
	} else {
		p_value =2*(1 - pnorm(abs(gammaStat(tree.hypostomus))))
	}
	
	list_values <- list(gamma=gamma,sim.gamma=gamma_null, p.value=p_value)
	return(list_values)
}


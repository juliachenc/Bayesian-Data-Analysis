//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

data {
  int<lower=0> J;        
  int y[J];              
  int n[J];
}

parameters {
  real mu;               
  vector[J] eta;          
  real<lower=0> tau;     
}

transformed parameters {
  vector[J] theta = mu + tau * eta;      

}
model {
 tau ~ cauchy(0,1);
 eta ~ normal(0,1);       
 y ~ binomial_logit(n, theta); 
}
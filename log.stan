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

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  vector[N] x;
  int<lower=0,upper=1> y[N];
}

// The parameters accepted by the model. Our model
// accepts two parameters 'alpha' and 'beta'.
parameters {
  real alpha;
  real beta;
}

// The model to be estimated. We model the output
// 'y' to be bernoulli logistic distributed with alpha
// and beta.
model {
  y ~ bernoulli_logit(alpha + beta * x);
}



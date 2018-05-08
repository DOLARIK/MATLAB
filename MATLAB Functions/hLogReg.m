function g = hLogReg(theta,X)
g = 1/(1 + exp(-X*theta));
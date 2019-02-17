library("lpSolve", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")

#  defining parameters
obj.fun = c(8,6,3,2,4,9)

m = 2
n = 3

constr = matrix(0, n+m, n*m)

for (i in 1:m) {
  for (j in 1:n) {
    constr[i, n*(i-1) + j] = 1
    constr[m+j, n*(i-1) + j] = 1
  }
}

constr.dir = c(rep("<=", m), rep(">=",n))

rhs = c(70, 40, 40, 35, 25)

# Solving LP model
prod.trans = lp("min", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

# LP Solution
prod.trans$objval
sol = matrix(prod.trans$solution, m, n, byrow = TRUE)
prod.trans$duals

# Sensitivity analysis of LP
prod.trans$duals.from
prod.trans$duals.to
prod.trans$sens.coef.from
prod.trans$sens.coef.to


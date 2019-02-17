library("lpSolve", lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")

#  defining parameters

obj.fun = c(20,60)
constr = matrix(c(30,20,5,10,1,1), ncol = 2, byrow = TRUE)
constr.dir = c("<=", "<=", ">=")
rhs = c(2700, 850, 95)

# Solving the model

prod.sol = lp("max", obj.fun, constr, constr.dir, rhs, compute.sens = TRUE)

# Accessing to R output

prod.sol$objval # Objective function value
prod.sol$solution # decision variables values
prod.sol$duals # includes duals of constraints and reduced costs of variables

# sensibility analysis results

prod.sol$duals.from
prod.sol$duals.to
prod.sol$sens.coef.from
prod.sol$sens.coef.to

SolverLP <- function (model , method =" CPLEX _LP", decimal =0)
{
  library(Rglpk, lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
  model1.lp = Rglpk_read_file(model, type = method, verbose =F)
  
  model1.lp.sol = Rglpk_solve_LP(model1.lp$objective,model1.lp$constraints[[1]],model1.lp$constraints[[2]],model1.lp$constraints[[3]], model1.lp$bounds,model1.lp$types,model1.lp$maximum)
  
  library (xtable, lib.loc="/Library/Frameworks/R.framework/Versions/3.5/Resources/library")
  model1.lp.sol.df = as.data.frame(model1.lp.sol$solution)
  
  model1.lp.sol.df = rbind (model1.lp.sol.df , c(model1.lp.sol$optimum ))
  rownames (model1.lp.sol.df) = c(attr(model1.lp,"objective _ vars _ names "),"obj ")
  
  colnames(model1.lp.sol.df) = "Solution"
  
  table.sol = xtable(model1.lp.sol.df, digits = decimal)
  
  results = list(sol = model1.lp.sol, df= model1.lp.sol.df, latex = table.sol)
  
  return ( results )
}
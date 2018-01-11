library(lpSolveAPI)
# The first step is to create a model, which takes as arguments the
# number of constraints in your model, and the number of decision
# variables in your model.
toy = make.lp(4,2)
# Now we need to set up the constraints and objective. The best way to 
# do this using the lpSolveAPI package is by viewing the constraints in
# a matrix format.
set.column(toy, 1, c(2, 3, 1, 1))
set.column(toy, 2, c(1, 4, 1, -1))
set.constr.type(toy, c("<=","<=","<=" ,"<="))
set.rhs(toy, c(1200,2400,800,450))

#Objective Coefficient c(8,5)
set.objfn(toy, c(8,5))
lp.control(toy,sense='max')
# If we want to take a look at our model, we can just type:
toy
# Now we are ready to solve our model:
solve(toy)
# An output of zero means that the model was successfully solved. 
# You can look at the optimal objective function value or optimal
# decision variable values with get.objective and get.variables:
get.objective(toy)
get.variables(toy)
#Plot a graph
plot(toy)
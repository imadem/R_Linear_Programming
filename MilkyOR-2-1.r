library(lpSolveAPI)
# The first step is to create a model, which takes as arguments the
# number of constraints in your model, and the number of decision
# variables in your model.
air = make.lp(4,2)
# Now we need to set up the constraints and objective. The best way to 
# do this using the lpSolveAPI package is by viewing the constraints in
# a matrix format.
set.column(air, 1, c(6, 1, -1,0))
set.column(air, 2, c(4, 2, 1, 1))
set.constr.type(air, c("<=","<=","<=" ,"<="))
set.rhs(air, c(24,6,1, 2))

#Objective Coefficient
set.objfn(air, c(5,4))
lp.control(air,sense='max')
# If we want to take a look at our model, we can just type:
air
# Now we are ready to solve our model:
solve(air)
# An output of zero means that the model was successfully solved. 
# You can look at the optimal objective function value or optimal
# decision variable values with get.objective and get.variables:
get.objective(air)
get.variables(air)
plot(air)



AirlineSimple
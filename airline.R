library(lpSolveAPI)

# Now let's start by solving the simple airline problem with just 
# two decision variables: the number of regular seats to offer, and 
# the number of discount seats to offer. 

# The first step is to create a model, which takes as arguments the
# number of constraints in your model, and the number of decision
# variables in your model. We have three constraints (one capacity
# constraint and two demand constraints) and two decision variables.

AirlineSimple = make.lp(3,2)

# Now we need to set up the constraints and objective. The best way to 
# do this using the lpSolveAPI package is by viewing the constraints in
# a matrix format. Our objective and three constraints are as follows:
# max         617*R + 238*D
# subject to    1*R +   1*D <= 166
#               1*R +   0*D <= 100
#               0*R +   1*D <= 150	

# So the first column in our constraint matrix is c(1,1,0), and the
# second column in our constraint matrix is c(1,0,1). We also need to
# indicate that these are less-than-or-equal constraints, and set the
# right-hand-side values to c(166,100,150):

set.column(AirlineSimple, 1, c(1,1,0))
set.column(AirlineSimple, 2, c(1,0,1))
set.constr.type(AirlineSimple, c("<=","<=","<="))
set.rhs(AirlineSimple, c(166,100,150))

# And our objective coefficients are c(617,238):

set.objfn(AirlineSimple, c(617,238))

# The default setting is minimize for the objective, so we need to 
# tell R that we are maximizing our objective:

lp.control(AirlineSimple,sense='max')

# If we want to take a look at our model, we can just type:

AirlineSimple

# You should see that there is a row called "Lower" in the model 
# output -- the values of zero indicate that our decision variables 
# are constrained to be non-negative, which is the default setting.
# If you want to change the lower or upper bounds for a decision
# variable, you can do so with the set.bounds function. (Next week 
# we will learn about integer and binary decision variables -- to 
# change a decision variable to one of these types, you can use 
# the set.type function.)

# Now we are ready to solve our model:

solve(AirlineSimple)

# An output of zero means that the model was successfully solved. 
# You can look at the optimal objective function value or optimal
# decision variable values with get.objective and get.variables:

get.objective(AirlineSimple)
get.variables(AirlineSimple)
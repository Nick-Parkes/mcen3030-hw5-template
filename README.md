Homework 5:

Stent Devolopment

A Monte Carlo simulation was used to estimate the probability of successful treatment as a function of stent lifetime and drug dosage. Random samples were generated to model variability in side effects, and effectiveness was evaluated for each trial. The probability of success was calculated as the fraction of simulations where the effectiveness exceeded a threshold, and the results were visualized using a surface plot.


RK4 & SEIR
A fourth-order Runge-Kutta (RK4) method was implemented to numerically solve a system of ordinary differential equations. This method was applied to the SEIR epidemiological model to simulate the spread of a disease over time. The populations of susceptible, exposed, infected, and recovered individuals were computed and plotted, showing the characteristic rise and fall of the infected population.



Boundary Layer
The boundary layer equation was solved using the shooting method combined with the secant method and the RK4 solver. The unknown initial condition x"(0) was iteratively adjusted until the boundary condition 𝑥'(6)=1 was satisfied. The resulting velocity profile increases smoothly from zero and approaches one, matching expected physical behavior.

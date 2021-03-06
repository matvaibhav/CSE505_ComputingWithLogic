% 
% Bus driver scheduling in ASP.
% 
% """
% Specification
% Bus driver scheduling can be formulated as a set paritioning problem. 
% We propose 12 set partitioning problems derived from small bus driver 
% scheduling problems. These consist of a given set of tasks (pieces of 
% work) to cover and a large set of possible shifts, where each shift 
% covers a subset of the tasks and has an associated cost. We must select 
% a subset of possible shifts that covers each piece of work once and 
% only once: this is called a partition. Further,
% 
% In the driver scheduling (unlike air crew scheduling) the main aim is 
% to reduce the number of shifts used in the solution partition and the 
% total cost of the partition is secondary. To simplify the problem we have 
% made the cost of each shift the same. This means that the goal is to 
% minimise the number of shifts.

% domains
% works(0..num_work-1).
% shifts(1..num_shifts).
works(Work) :- shift(Shift, Work).
shifts(Shift) :- shift(Shift, Work).

% x: selected shift
% we must have at least min_num_shifts selected
min_num_shifts { x(Shift) : shifts(Shift) }.

% all works must be selected exactly once
1 { x(Shift) : shift(Shift, Work) } 1 :- works(Work).

total_shifts(TotalShifts) :- TotalShifts = #count{Shift:x(Shift), shifts(Shift)}.

% minimize total number of shifts
#minimize {1,Shift:x(Shift), shifts(Shift)}.


#show x/1.
#show total_shifts/1.

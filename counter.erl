-module(counter). 
-export([start/0,loop/1,increment/1,value/1,stop/1, do_something/0]). 

%% First the interface functions. 
start() -> 
  spawn(counter, loop, [0]). 
  
increment(Counter) -> 
  Counter ! increment. 
  
value(Counter) -> 
  Counter ! {self(),value}, 
  receive 
    {Counter,Value} -> 
      Value 
  end. 
  
stop(Counter) -> 
  Counter ! stop. 
  
%% The counter loop. 
loop(Val) -> 
  receive 
    increment -> 
      loop(Val + 1); 
    {From,value} -> 
      From ! {self(),Val}, 
      loop(Val); 
    stop -> % No recursive call here 
      true; 
    Other -> % All other messages 
      loop(Val) 
  end.
  
do_something() ->
  Pid = start(),
  increment(Pid),
  increment(Pid),
  Pid2 = start(),
  increment(Pid2),
  io:format("Value: ~w~n",[value(Pid)]),
  io:format("Value2: ~w~n",[value(Pid2)]),
  stop(Pid),
  stop(Pid2).
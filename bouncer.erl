-module(bouncer).
-export([bounce/1, ping/2, ponger/0]).

% Spawn a pinger and a ponger and message back and forth +M+ times
bounce(M) ->
  Ponger = spawn(bouncer, ponger, []),
  spawn(bouncer, ping, [Ponger, M]).
  
% I'm going to pong +Ponger+ +M+ times  
% When I've done that I'm going to tell Ponger to stop, and I'll stop
ping(Ponger, M) when M > 0 ->
  Ponger ! {self(), ping},
  receive
    {Ponger, pong} ->
      io:format("Ponged"),
      ping(Ponger, M - 1);
    stop ->
      true;
    % This is a safe guard, we only want to count pong's from +Ponger+
    Other ->
      ping(Ponger, M)
  end;
ping(Ponger, 0) ->
  Ponger ! stop.
  
% If I get a ping, im going to pong back  
ponger() ->
  receive
    {From, ping} ->
      io:format("Pinged"),
      From ! {self(), pong},
      ponger();
    stop ->
      true;
    % We'll ping anyone back, but it has to be in form {From, ping}
    Other ->
      ponger()
  end.
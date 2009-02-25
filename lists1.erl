-module(lists1).
-export([min/1, max/1, min_max/1]).

min([H|L]) -> 
  min(H, L).
min(M, []) ->
  M;
min(M, [H|L]) when M < H ->
  min(M, L);
min(_M, [H|L]) ->
  min(H, L).
  
max([H|L]) -> 
  max(H, L).
max(M, []) ->
  M;
max(M, [H|L]) when M > H ->
  max(M, L);
max(_M, [H|L]) ->
  max(H, L).  
  
min_max(L) ->
  {min(L), max(L)}.
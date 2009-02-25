-module(time).
-export([swedish_date/0]).

swedish_date() ->
  string:substr(integer_to_list(element(1, date())), 3, 4) ++ pad_string(integer_to_list(element(2, date()))) ++ pad_string(integer_to_list(element(3, date()))). 
  
pad_string(A_string) ->
  if 
    length(A_string) == 1 -> "0" ++ A_string;
    true -> A_string
  end.
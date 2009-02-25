-module(temp).
-export([convert/1]).

convert({c, Temperature}) ->
  {f, c2f(Temperature)};
convert({f, Temperature}) ->
  {c, f2c(Temperature)};
convert(Other) ->
  {invalid_object, Other}.
  
c2f(X) ->
  ((9/5) * X) + 32.

f2c(X) ->
  (5/9) * (X - 32).  
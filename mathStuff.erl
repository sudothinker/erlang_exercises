-module(mathStuff).
-export([perimeter/1]).

perimeter({square, Side}) ->
  4 * Side;
perimeter({circle, Radius}) ->
  2 * 3.14 * Radius;
perimeter({triangle, A, B, C}) ->
  A + B + C;
perimeter(Other) ->
  {invalid_object, Other}.
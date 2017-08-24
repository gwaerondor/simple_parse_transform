-module(transformer).
-export([parse_transform/2]).

parse_transform([Filename, Module | AST], _) ->
    [Filename, Module | transform(AST)].

transform({op, Line, '+', Left, Right}) ->
    {op, Line, '-', transform(Left), transform(Right)};
transform([Something | Rest])  ->
    [transform(Something) | transform(Rest)];
transform(Tuple) when is_tuple(Tuple) ->
    list_to_tuple(transform(tuple_to_list(Tuple)));
transform(Other) ->
    Other.

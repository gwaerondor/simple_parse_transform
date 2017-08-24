-module(something).
-export([f/0]).
-compile({parse_transform, transformer}).

f() ->
    1 + 1.

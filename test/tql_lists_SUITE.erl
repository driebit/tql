-module(tql_lists_SUITE).

-include_lib("common_test/include/ct.hrl").
-include_lib("proper/include/proper.hrl").

-export([ all/0
          %% Tests
        , all_/1
        , some/1
        ]
       ).

all() ->
  [ all_
  , some
  ].

%%%---------------------------------------------------------------------
%%% Tests
%%%---------------------------------------------------------------------

all_(_Config) ->
  true = proper:quickcheck(
           ?FORALL( L
                  , list(boolean())
                  , ?IMPLIES(not lists:member(false, L)
                            , tql_lists:all(L)
                            )
                  )
          ),
  ok.

some(_Config) ->
  true = proper:quickcheck(
           ?FORALL( L
                  , list(boolean())
                  , ?IMPLIES(lists:member(true, L)
                            , tql_lists:some(L)
                            )
                  )
          ),
  ok.

%% Local variables:
%% mode: erlang
%% erlang-indent-level: 2
%% indent-tabs-mode: nil
%% fill-column: 72
%% coding: latin-1
%% End:

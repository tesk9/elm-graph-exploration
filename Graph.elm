module Graph exposing (Model, (=>))

{-| Graph experimentally provides an interface for declaring graph-relationships and displaying.
-}

--MODEL


{-| List out each relationship you'd like to describe.
-}
type alias Model a =
    { relations : List ( a, a )
    }



--UTILS


{-| (=>) is an alias for (,), provided for visual clarity/convenience.
-}
(=>) : a -> b -> ( a, b )
(=>) =
    (,)

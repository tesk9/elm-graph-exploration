module Graph exposing (model, (=>))

{-| Graph experimentally provides an interface for declaring graph-relationships and displaying.
-}

import Dict
import Html
import Set


--MODEL


type alias Model comparable =
    { relations : Set.Set comparable
    }


{-| List out each relationship you'd like to describe, and use `model` to initialize.
-}
model : List ( comparable, comparable ) -> Model comparable
model relations =
    { relations = process relations }


process : List ( comparable, comparable ) -> Set.Set comparable
process relations =
    findDisconnectedCentralNodes relations
        |> (\_ -> Set.empty)


findDisconnectedCentralNodes : List ( comparable, comparable ) -> Dict.Dict comparable Int
findDisconnectedCentralNodes relations =
    List.foldl countOccurrences Dict.empty relations


countOccurrences : ( comparable, comparable ) -> Dict.Dict comparable Int -> Dict.Dict comparable Int
countOccurrences items dict =
    dict
        |> countOccurrence (fst items)
        |> countOccurrence (snd items)


countOccurrence : comparable -> Dict.Dict comparable Int -> Dict.Dict comparable Int
countOccurrence item dict =
    Dict.get item dict
        |> Maybe.withDefault 0
        |> \occurrence ->
            Dict.insert item (occurrence + 1) dict



--VIEW


{-| `view` produces a visualization based on the model passed in.
-}
view : Model comparable -> Html.Html msg
view model =
    Html.div [] []



--UTILS


{-| (=>) is an alias for (,), provided for visual clarity/convenience.
-}
(=>) : a -> b -> ( a, b )
(=>) =
    (,)

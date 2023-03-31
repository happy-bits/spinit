{-

Exercise:

Add a button "Double"
When the user clicks the button, the number should double

-}


module Button05_Exercise exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- MAIN

main =
  Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model = 
  List Int

init : Model
init =
  [100]

-- UPDATE

type Msg
  = Increment
  | Decrement
  | Square
  | Reset
  | Undo
  
firstValue : Model -> Int
firstValue model = 
  List.head model |> Maybe.withDefault -999

removeFirstIfNotEmpty : List Int -> List Int
removeFirstIfNotEmpty list = 
  case list of
    [] -> []
    _ :: [] -> list
    _ :: tail -> tail


update : Msg -> Model -> Model
update msg model =

  case msg of

    Increment ->
       ((firstValue model) + 1) :: model 

    Decrement ->
       (firstValue model - 1) :: model 

    Square ->
       (firstValue model) ^ 2 :: model 

    Reset ->
       0 :: model

    Undo ->
      model |> removeFirstIfNotEmpty 

view : Model -> Html Msg
view model =
  div []
    [ 
    div [] [ text (List.head model |> Maybe.withDefault -999 |> String.fromInt) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick Increment ] [ text "+" ]
    , button [ onClick Square ] [ text "Square" ]
    , button [ onClick Reset ] [ text "Reset" ]
    , button [ onClick Undo ] [ text "Undo" ]
    ]
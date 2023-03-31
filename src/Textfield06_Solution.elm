{-

Solution to Textfield06

-}

module Textfield06_Solution exposing (..)

import Browser
import Html exposing (Html, div, input, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

-- MAIN

main : Program () { password : String, repeat : String, username : String } Msg
main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
  { password : String,
    repeat: String,
    username: String
  }

init : { password : String, repeat : String, username : String }
init =
  { password = "",
  repeat = "",
  username = "" }

-- UPDATE

type Msg
  = ChangePassword String
  | ChangeRepeatPassword String
  | Clear
  | Uppercase
  | ChangeUsername String

update : Msg -> Model -> Model
update msg model =
  case msg of

    ChangePassword newcontent ->
      { model | password = newcontent }
  
    ChangeRepeatPassword newcontent ->
      { model | repeat = newcontent }

    Clear ->
      { password = "", repeat="", username="" }

    Uppercase ->
      { password = String.toUpper model.password,
      repeat = String.toUpper model.repeat,
      username = String.toUpper model.username }

    ChangeUsername newcontent ->
      { model | username = newcontent }

choose :  String -> String -> Bool -> String
choose trueString falseString b =
  if b then trueString else falseString

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ 
      viewInput "Username" model.username ChangeUsername,
      viewInput "Enter password" model.password ChangePassword,
      viewInput "Again" model.repeat ChangeRepeatPassword,

      div [] [text (model.password == model.repeat |> choose "Samma" "Olika")],

      viewButton "Clear" Clear,
      viewButton "Uppercase" Uppercase
    ]

viewButton : String -> msg -> Html msg
viewButton buttonText click =
  button [ onClick click ] [ text buttonText ]

viewInput : String -> String -> (String -> msg) -> Html msg
viewInput divText inputValue change =
  div[]
  [
    div [][text divText],
    input [ value inputValue, onInput change] []
  ]
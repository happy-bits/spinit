{-

Exercise

Add a textbox for username at the top of the form

"Clear" should clear the username as well
"Upper" should make the username uppercase as well

-}

module Textfield06_Exercise exposing (..)

import Browser
import Html exposing (Html, div, input, text, button)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

-- MAIN

main : Program () { password : String, repeat : String } Msg
main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL

type alias Model =
  { password : String,
    repeat: String
  }

init : { password : String, repeat : String }
init =
  { password = "",
  repeat = "" }

-- UPDATE

type Msg
  = ChangePassword String
  | ChangeRepeatPassword String
  | Clear
  | Uppercase

update : Msg -> Model -> Model
update msg model =
  case msg of

    ChangePassword newcontent ->
      { model | password = newcontent }
  
    ChangeRepeatPassword newcontent ->
      { model | repeat = newcontent }

    Clear ->
      { password = "", repeat="" }

    Uppercase ->
      { password = String.toUpper model.password,
      repeat = String.toUpper model.repeat}

choose :  String -> String -> Bool -> String
choose trueString falseString b =
  if b then trueString else falseString

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ 
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
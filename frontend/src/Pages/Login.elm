module Pages.Login exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Material.Button as Button
import Material.Options as Options
import Material.Elevation as Elevation
import Material.Menu as Menu
import Material.Table as Table
import Material.Textfield as Textfield
import Material.Toggles as Toggles

type alias Model =
  { username : String
  , password : String
  }

type Msg
  = SetUsername String
  | SetPassword String
  | Submit
--  | LoginCompleted (Result Http.Error User)

type ExternalMsg
  = NoOp

view : LoginModel -> List (Html Msg)
view model =
  renderHeader model "Login" Nothing Nothing
    ++ [ Html.form []
        [ Textfield.render Mdl
          [5]
          model.mdl
          [ Textfield.label "Username"
          , Textfield.floatingLabel
          , Textfield.text_
          , TextField.onInput SetUsername
          , Options.css "display" "block" ]
        , Textfield.render Mdl
          [6]
          model.mdl
          [ Textfield.label "Password"
          , Textfield.floatingLabel
          , Textfield.text_
          , Textfield.password
          , TextField.onInput SetPassword
          , Options.css "display" "block" ]
        , Button.render Mdl
          [7]
          model.mdl
          [ Button.raised
          , Button.colored
          , Button.onClick Submit
          ]
          [ text "Login" ]
        ]
      ]

update : Msg -> Model -> (( Model, Cmd Msg ), ExternalMsg)
update msg model =
  case msg of
    Submit -> crash "TODO"
    SetUsername s ->
      { model | username = s }
        => Cmd.none
        => NoOp
    SetPassword s ->
      { model | password = s }
        => Cmd.none
        => NoOp

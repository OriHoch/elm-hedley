module Pages.PageNotFound.View where

import Html exposing (a, i, div, h2, text, Html, button)
import Html.Attributes exposing (class, id, href, style)
import Pages.PageNotFound.Update exposing (Action)
import Pages.PageNotFound.Model exposing (Model)
import Html.Events exposing (onClick)

-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  let
    getRepo name =
      div [] [text name]
  in
    div
      [ id "page-not-found"
      , class "container"
      ]
      [ div
          [ class "wrapper text-center" ]
          [
          div
            [ class "box" ]
            [ h2 [] [ text "This is a 404 page!" ]
            , a [ href "#!/" ] [ text "Back to safety" ]
            ]
          ]
           , div
            [ class "box" ]
            [ h2 [] [text "GitHub forks of Gizra/elm-hedley"]
            , div [] (List.map getRepo model)
            ]
      ]

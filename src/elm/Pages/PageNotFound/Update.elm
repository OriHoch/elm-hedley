module Pages.PageNotFound.Update where
import Effects exposing (Effects, Never)
import Http
import Json.Decode as Json
import Task
import Pages.PageNotFound.Model exposing (Model)

init : (Model, Effects Action)
init =
  ( []
  , getRepos
  )


type Action
    = NewRepos (Maybe (List String))

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NewRepos maybeUrl ->
      ( Maybe.withDefault model maybeUrl
      , Effects.none
      )

-- EFFECTS

getRepos : Effects Action
getRepos  =
  Http.get decodeUrl getUrl
      |> Task.toMaybe
      |> Task.map NewRepos
      |> Effects.task

getUrl : String
getUrl =
  Http.url "https://api.github.com/repos/gizra/elm-hedley/forks" []

decodeUrl : Json.Decoder (List String)
decodeUrl =
  Json.list (Json.at ["full_name"] Json.string)

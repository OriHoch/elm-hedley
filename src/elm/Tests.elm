module Tests where

import ElmTest.Assertion exposing (..)
import ElmTest.Test exposing (..)

import String


import Company exposing (Model)
import Effects exposing (Effects)
import Event exposing (initialModel, UpdateContext)


selectCompanySuite : Test
selectCompanySuite =
  suite "Select Company Action Suite"
    [ test "no company" (assertEqual Nothing (.selectedCompany <| fst(selectCompany Nothing)))
    , test "valid company" (assertEqual (Just 1) (.selectedCompany <| fst(selectCompany <| Just 1)))
    , test "invalid company" (assertEqual Nothing (.selectedCompany <| fst(selectCompany <| Just 100)))
    ]

selectCompany : Maybe Int -> (Event.Model, Effects Event.Action)
selectCompany val =
  Event.update contextData (Event.SelectCompany val) Event.initialModel

companies : List Company.Model
companies =
  [ Company.Model 1 "foo"
  , Company.Model 2 "bar"
  , Company.Model 3 "baz"
  ]

contextData : Event.UpdateContext
contextData =
  Event.UpdateContext "" companies

all : Test
all =
  suite "All tests"
    [ selectCompanySuite
    ]

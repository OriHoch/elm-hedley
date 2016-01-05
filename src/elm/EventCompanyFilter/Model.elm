module EventCompanyFilter.Model where

type alias Model = { val : Maybe Int, counter : Int }

initialModel : Model
initialModel = {val = Nothing, counter = 0}

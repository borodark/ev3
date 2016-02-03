module Comportment.Update where

import Dict exposing (Dict)
import Effects exposing (Effects)
import Comportment.Model as Model exposing (Model, BehaviorData)
import Status.Model exposing (ActiveState)

type Action =
  SetBehavior BehaviorData
    | ReviveAll ActiveState

update: Action -> Model -> (Model, Effects Action)
update action model =
  let
    revive behavior =
       {behavior | overwhelmed = False}
    insert dict behavior =
      Dict.insert behavior.name behavior dict
    revive_all = 
      Dict.foldl (\name behavior dict -> revive behavior |> insert dict) Dict.empty model.behaviors 
  in
    case action of
      ReviveAll activeState ->
        if activeState.active then
          ({model | behaviors = revive_all}, Effects.none)
        else
          (model, Effects.none)
      SetBehavior behaviorData ->
        let
          behavior = Dict.get behaviorData.name model.behaviors |> Maybe.withDefault Model.defaultBehavior
          updatedBehavior =
            case behaviorData.event of
              "started" -> {behavior | started = True}
              "stopped" -> {behavior | started = False}
              "overwhelmed" -> {behavior | started = True, inhibited = False, overwhelmed = True}
              "inhibited" -> {behavior | started = True, inhibited = True}
              "transited" -> {behavior | started = True, inhibited = False, state = behaviorData.value}
              _ -> behavior
        in
          ({model | behaviors = Dict.insert behavior.name updatedBehavior model.behaviors}, Effects.none)


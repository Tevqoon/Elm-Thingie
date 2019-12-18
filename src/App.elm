module App exposing (..)

import Html
import Html.Events as He
import Browser exposing (element)

import Html exposing (..)
import Bootstrap.CDN as CDN
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Row as Row
import Bootstrap.Grid.Col as Col
import Bootstrap.Button as Button

type alias Model = 
    {
    value: Int,
    numberOfClicks: Int
    }

type Msg = Initialize | Increment | Decrement | Double

-- initialModel : (Model , Cmd Msg)
initialModel () = ({value=0, numberOfClicks=0}, Cmd.none)

view model = 
    Grid.container [] [
        Html.h1 [] [Html.text "Hello, World"],
        Html.h2 [] [Html.text (String.fromInt (model.value * 3))],
        Button.button [Button.onClick Increment] [Html.text "Increment"],
        Button.button [Button.warning, Button.onClick Decrement] [Html.text "Decrement"],
        Html.h2 [] [Html.text (String.fromInt model.numberOfClicks)],
        Button.button [
            Button.success,
            Button.block,
            Button.attrs [He.onClick Double]] 
                    [Html.text "DOUBLE!"], --can convert html attributes to bootstrap too
        Button.button [Button.onClick Initialize] [Html.text "reset"]
    ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model = 
    case msg of 
        Increment -> ({value = model.value + 1, numberOfClicks = model.numberOfClicks + 1}, Cmd.none)
        Decrement -> ({value = model.value - 1, numberOfClicks = model.numberOfClicks + 1}, Cmd.none)
        Double -> ({value = model.value * 2, numberOfClicks = model.numberOfClicks + 1}, Cmd.none)
        Initialize -> initialModel ()
        --_ -> (model, Cmd.none) 


main = 
    element 
    {
        init = initialModel , 
        update = update,
        view = view,
        subscriptions = \_ -> Sub.none
    }
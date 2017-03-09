port module ElmDeviceMotionAcceleration exposing (..)

import Html exposing (Html, text)

main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
            
init : (Model, Cmd Msg)
init =
    (Model {x = 0, y = 0, z = 0}, Cmd.none)

type alias Model =
    { deviceMotionAcceleration : Point3D
    }

type alias Point3D =
    { x : Float
    , y : Float
    , z : Float
    }

type Msg = GetDeviceMotionAcceleration Point3D

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        GetDeviceMotionAcceleration point3d ->
            ({model | deviceMotionAcceleration = point3d}, Cmd.none)
        
view : Model -> Html Msg
view model =
    text <| toString model.deviceMotionAcceleration

port deviceMotionAcceleration : (Point3D -> msg) -> Sub msg
               
subscriptions : Model -> Sub Msg
subscriptions model = 
    Sub.batch
        [ deviceMotionAcceleration GetDeviceMotionAcceleration
        ]

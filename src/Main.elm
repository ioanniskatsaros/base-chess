module Main exposing (..)

import Chess.Piece.Shape as Piece
import Playground as P


main =
    P.game view update initModel


type alias Model =
    { board : Board
    }


type Board
    = Board


initModel : Model
initModel =
    { board = Board }


view : P.Computer -> Model -> List P.Shape
view _ model =
    List.map (P.moveLeft 80)
        [ Piece.board P.black P.white
        ]


update : P.Computer -> Model -> Model
update computer model =
    model

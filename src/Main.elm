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
        [ Piece.pawn P.gray |> P.moveLeft 80
        , Piece.bishop P.black |> P.moveDown 80
        , Piece.knight P.red
        , Piece.rook P.blue |> P.moveUp 80
        , Piece.king P.green |> P.moveRight 80
        , Piece.queen P.orange |> P.move 80 80
        ]


update : P.Computer -> Model -> Model
update computer model =
    model

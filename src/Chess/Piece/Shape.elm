module Chess.Piece.Shape exposing (..)

import Playground exposing (Color, Shape, circle, group, moveDown, moveUp, polygon, rectangle, rotate, triangle)


pawn : Color -> Shape
pawn c =
    group
        [ triangle c 40 |> moveDown 35
        , circle c 20
        ]


bishop : Color -> Shape
bishop c =
    group
        [ triangle c 40 |> moveDown 35
        , triangle c 40 |> moveUp 10
        ]


knight : Color -> Shape
knight c =
    group
        [ polygon c [ ( -30, 0 ), ( 30, 60 ), ( 30, 0 ) ] |> moveDown 10
        , triangle c 40 |> moveDown 35
        ]


rook : Color -> Shape
rook c =
    rectangle c 40 80


king : Color -> Shape
king c =
    group
        [ rectangle c 40 70 |> moveDown 10
        , triangle c 40 |> rotate 180
        ]


queen : Color -> Shape
queen c =
    group
        [ rectangle c 40 70 |> moveDown 10
        , triangle c 40 |> rotate 180
        , triangle c 40
        ]

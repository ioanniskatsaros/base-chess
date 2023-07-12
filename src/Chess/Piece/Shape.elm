module Chess.Piece.Shape exposing (..)

import Playground exposing (..)


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
        , triangle c 40
        ]


knight : Color -> Shape
knight c =
    group
        [ triangle c 40 |> moveDown 35
        , oval c 30 60 |> move -10 0 |> rotate -45
        , triangle c 15 |> move 0 18
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


board : Color -> Color -> Shape
board black_ white_ =
    let
        flip : (a -> b -> c) -> b -> a -> c
        flip f b a =
            f a b

        placeSquares : List (Color -> Shape) -> List Shape
        placeSquares =
            List.indexedMap
                (\n sq ->
                    let
                        c =
                            modBy 8 n

                        l =
                            n // 8
                    in
                    move
                        (toFloat (80 * c))
                        (toFloat (80 * l))
                        (sq
                            (if
                                (modBy 2 l == 1 && modBy 2 c == 0)
                                    || (modBy 2 l == 0 && modBy 2 c == 1)
                             then
                                white_

                             else
                                black_
                            )
                        )
                )

        {-

           B | W | B
           _ _ _ _ _
           W | B | W
           _ _ _ _ _
           B | W | B
        -}
    in
    List.repeat 64 (flip square 80)
        |> placeSquares
        |> group
        |> move -256 -256
        |> scale 0.8
